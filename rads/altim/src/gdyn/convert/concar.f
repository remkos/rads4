      PROGRAM CONCAR
C********1*********2*********3*********4*********5*********6*********7**
C CONCAR           91/07/16            9107.0    PGMR - SCOTT B. LUTHCKE
C
C *** TO BE USED WITH TDF9201 AND ABOVE ON 64 BIT INTEGER MACHINES
C
C FUNCTION:         THIS PROGRAM CONVERTS GEODYN1, EXTENDED ALTIMETRY,
C                   AND METRIC CARD IMAGE DATA CREATED BY THE CONOGB
C                   TO CRAY BINARY FORMAT (FOR THE CRAY TDF).  THIS
C                   PROGRAM SHOULD ONLY BE RUN ON THE CRAY.
C
C UNITS:
C        UNIT 4 - INPUT OPTION CARDS.  THE CHOICES ARE:
C                 METRIC - INPUT DATA IS METRIC CARD IMAGE FORMAT
C                 EXALT  - INPUT DATA IS CARD IMAGE EXTENDED ALTIMETER
C
C * IF NO CARDS ARE PRESENT THEN THE INPUT DATA IS GEODYN1 CARD IMAGE
C
C UNITS:
C       UNIT 10 - INPUT CARD IMAGE DATA SET
C       UNIT 11 - OUTPUT CRAY BINARY DATA SET
C       UNIT 6  - PROGRAM INFORMATIVE MESSAGES AND CONTROL MESSAGES
C
C
C********1*********2*********3*********4*********5*********6*********7**
      IMPLICIT REAL(A-H,O-Z),LOGICAL(L)
      CHARACTER*6 CARD,METRIC,EXALT
C USED FOR GEODYN1 BINARY
      COMMON/GEOBEG/ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC           GEO1
      COMMON/GEOANG/OBSRTA,OBSDEC,STDDV1,STDDV2,TROPXA,TROPEL,
     1 RD1ANG,RD2ANG,RD3ANG,RD4ANG
      COMMON/GEORNG/OBSRNG,ISTARG,ISATRG,STDVRG,TROPRG,METRNG,
     1 IDMRNG,RNGION,ANTRNG,COMRNG,RD1RNG,RD2RNG
      COMMON/GEORGR/OBSRGR,ISTRR1,ISTRR2,STDVRR,INTCRR,IDMRGR,TROPRR,
     1 RGRION,RGRR01,RGRR02,RD1RGR,RD2RGR
      COMMON/GEOALT/OBSALT,SATLAT,SATLON,STDVAL,ALTBIS,TROPAL,ALTION,
     1 ALTGEO,ALTTID,RDMALT
      COMMON/GEOMIN/OBSMNE,OBSMNN,STDVME,STDVMN,TROPME,TROPMN,CORIOE,
     1 CORION,RD1MIN,RD2MIN
      COMMON/GEOLND/CNTELM,CNTLIN,STDVEC,STDVLC,ILNDLT,ILNDLG,ILNDBT,
     1 ILNDST,RD1LND,RD2LND,RD3LND,RD4LND                               GEO1
      COMMON/GEOEXA/OBSEXA,ISATLT,ISATLN,STDVEA,INSCOR,METEXA,
     1 MEDCOR,IDMEXA,GEOHEX,IOCCOR,ISURF,IREV,ISRFMN,IDOD,IH13,IAGC,    GEO1
     2 IWIND,ISRFPR,IDTROP,IFNOC,ISMMR,IONC,IBARO,ISTID,IOCNT1,IOCNT2,  GEO1
     3 ID2EXA
C USED FOR GEOS C CARD IMAGE TO BINARY CONVERSION IN TOBNRY
C USED FOR METRIC BINARY
      COMMON/METRIC/MTS1,MTT1,MTS2,MTT2,MTS3,MTT3,MTMTTS,
     1  MTUSMT,MTPSMT,MTSSMT,MTPRE,MTOBT,GPPOBT,GPSOBT,GPOBS,
     2  GPAMB,GPSATP,GPSATS,GPSTAP,GPSTAS,SPARE,HCG,HAAD,
     3  HTROPO,HION,HXPD,HRELC,HSPARE,HLIGHT,HOPWLN,HSTDDV
      COMMON/UNITS/IN,IOUT,IMSG,ICARD
C
      DATA METRIC,EXALT/'METRIC','EXALT'/
      DATA RDUM/0.0E0/,IDUM/0/
C
C
C**********************************************************************
C START OF EXECUTABLE CODE
C**********************************************************************
C * INITIALIZATIONS
      LMETRC=.FALSE.
      LEXALT=.FALSE.
      IN=10
      IOUT=11
      IMSG=6
      ICARD=4
C READ OPTION CARDS
  100 READ(ICARD,10000,END=200) CARD
      IF(CARD.EQ.METRIC) THEN
      LMETRC=.TRUE.
      ELSE IF(CARD.EQ.EXALT) THEN
      LEXALT=.TRUE.
      ENDIF
      GOTO 100
  200 CONTINUE
C OPTION CARDS HAVE BEEN READ - PRINT OUT OPTIONS SELECTED
      IF(LMETRC) THEN
      WRITE(IMSG,10100)
      ELSE IF(LEXALT) THEN
      WRITE(IMSG,10200)
      ELSE
      WRITE(IMSG,10300)
      ENDIF
C READ TYPE OF INPUT FORMAT AND LOAD CORRECT COMMON BLOCK
      IF(LEXALT) GOTO 1000
      IF(LMETRC) GOTO 2000
C****************************
C INPUT = GEODYN1 BINARY
C****************************
C ...READ GEODYN1 BINARY FORMAT
C ....LOAD GEOBEG COMMON BLOCK
 300  READ(IN,10400,END=9999) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,
     1                       DFRAC
C ....LOAD APPROPRIATE DATA TYPE BASED ON KTYPE, AND OUTPUT THE DATA
      IFORM=KTYPE/10
      GOTO (503,505,507,509,512,503,503,9001,507) IFORM
C ......KTYPE IS NOT OF CORRECT FORM
      GOTO 9001
C .....LOAD GEOANG COMMON BLOCK AND WRITE OUT
  503 CONTINUE
      READ(IN,10500,END=9300) OBSRTA,OBSDEC,STDDV1,STDDV2,TROPXA
      READ(IN,10600,END=9300) TROPEL
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSRTA,OBSDEC,STDDV1,STDDV2,TROPXA,TROPEL,
     2            RDUM,RDUM,RDUM,RDUM
      GOTO 300
C .....LOAD GEORNG COMMON BLOCK AND WRITE OUT
  505 CONTINUE
      READ(IN,10700,END=9300) OBSRNG,ISTARG,ISATRG,STDVRG,TROPRG
      READ(IN,10800,END=9300) METRNG,IDMRNG,RNGION,ANTRNG,COMRNG
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSRNG,ISTARG,ISATRG,STDVRG,TROPRG,METRNG,
     2            IDMRNG,RNGION,ANTRNG,COMRNG
      GOTO 300
C .....LOAD GEORGR COMMON BLOCK AND WRITE OUT
  507 CONTINUE
      READ(IN,10900,END=9300) OBSRGR,ISTRR1,ISTRR2,STDVRR,INTCRR,IFLAG
       IF(IFLAG.EQ.1) THEN
       READ(IN,10801,END=9300) IMETRR,RGRION,RGRR01,RGRR02
       WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSRGR,ISTRR1,ISTRR2,STDVRR,INTCRR,IDUM,IMETRR,
     2            RNGION,RGRR01,RGRR02
       ELSE
       READ(IN,11000,END=9300) TROPRR,RGRION,RGRR01,RGRR02
       WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSRGR,ISTRR1,ISTRR2,STDVRR,INTCRR,IDUM,TROPRR,
     2            RNGION,RGRR01,RGRR02
       ENDIF
      GOTO 300
C .....LOAD GEOALT COMMON BLOCK AND WRITE OUT
  509 CONTINUE
      READ(IN,10500,END=9300) OBSALT,SATLAT,SATLON,STDVAL,ALTBIS
      READ(IN,11000,END=9300) TROPAL,ALTION,ALTGEO,ALTTID
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSALT,SATLAT,SATLON,STDVAL,ALTBIS,TROPAL,
     2            ALTION,ALTGEO,ALTTID,RDUM
      GOTO 300
C .....LOAD GEOMIN AND GEOLND COMMON BLOCK AND WRITE OUT
  512 CONTINUE
      IF((KTYPE.EQ.55).OR.(KTYPE.EQ.56)) GOTO 514
      READ(IN,10500,END=9300) OBSMNE,OBSMNN,STDVME,STDVMN,TROPME
      READ(IN,11000,END=9300) TROPMN,CORIOE,CORION,RDUM
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSMNE,OBSMNN,STDVME,STDVMN,TROPME,TROPMN,
     2            CORIOE,CORION,RDUM,RDUM
      GOTO 300
  514 CONTINUE
      READ(IN,11100,END=9300) CNTELM,CNTLIN,STDVEC,STDVLC,ILNDLT
      READ(IN,11200,END=9300) ILNDLG,ILNDBT
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            CNTELM,CNTLIN,STDVEC,STDVLC,ILNDLT,ILNDLG,
     2            ILNDBT,ILNDST,RDUM,RDUM
      GOTO 300
C****************************
C INPUT = EXTENDED ALTIMETRY
C****************************
 1000 CONTINUE
C ...READ GEODYN1 BINARY FORMAT EXTENDED FOR ALTIMETRY
C ....LOAD GEOEXA COMMON BLOCK
 1100 READ(IN,10400,END=9999) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC
      READ(IN,11300,END=9300) OBSEXA,ISATLT,ISATLN,STDVEA,INSCOR,METEXA,
     1                  MEDCOR,IDMEXA,GEOHEX
      READ(IN,11400,END=9300) IOCCOR,ISURF,
     1                  IREV,ISRFMN,IDOD,IH13,IAGC,IWIND,ISRFPR,
     2                  IDTROP,IFNOC,ISMMR,IONC,IBARO,ISTID,
     3                  IOCNT1,IOCNT2
      WRITE(IOUT) ISATID,KTYPE,KTIME,ISTATN,IPRE,IMJD,DFRAC,
     1            OBSEXA,ISATLT,ISATLN,STDVEA,INSCOR,METEXA,
     2            MEDCOR,IDMEXA,GEOHEX,IOCCOR,ISURF,IREV,ISRFMN,IDOD,
     3            IH13,IAGC,IWIND,ISRFPR,IDTROP,IFNOC,ISMMR,
     4            IONC,IBARO,ISTID,IOCNT1,IOCNT2,IDUM
      GOTO 1100
C****************************
C INPUT = METRIC DATA
C****************************
 2000 CONTINUE
C ...READ GEODYN BINARY METRIC FORMAT
C ....LOAD METRIC COMMON BLOCK
 2100 READ(IN,11500,END=9999) MTS1,MTT1,MTS2,MTT2,MTS3,MTT3,MTMTTS,
     1                    MTUSMT,MTPSMT,MTSSMT,MTPRE,MTOBT
      READ(IN,10500,END=9300) GPPOBT,GPSOBT,GPOBS,GPAMB,GPSATP
      READ(IN,10500,END=9300) GPSATS,GPSTAP,GPSTAS,SPARE,HCG
      READ(IN,10500,END=9300) HAAD,HTROPO,HION,HXPD,HRELC
      READ(IN,11000,END=9300) HSPARE,HLIGHT,HOPWLN,HSTDDV
      WRITE(IOUT) MTS1,MTT1,MTS2,MTT2,MTS3,MTT3,MTMTTS,MTUSMT,
     1            MTPSMT,MTSSMT,MTPRE,MTOBT,GPPOBT,GPSOBT,GPOBS,
     2            GPAMB,GPSATP,GPSATS,GPSTAP,GPSTAS,SPARE,HCG,
     3            HAAD,HTROPO,HION,HXPD,HRELC,HSPARE,HLIGHT,HOPWLN,
     4            HSTDDV
      GOTO 2100
C ERROR MESSAGES
 9001 WRITE(IMSG,90001) IFORM
      STOP
 9300 WRITE(IMSG,90300)
      STOP
 9999 WRITE(IMSG,99999)
      STOP
10000 FORMAT(A6)
10100 FORMAT(1X,'*** INPUT DATA IS METRIC BINARY ***')
10200 FORMAT(1X,'*** INPUT DATA IS EXTENDED ALTIMETER BINARY ***')
10300 FORMAT(1X,'*** INPUT DATA IS GEODYN1 BINARY ***')
10400 FORMAT(I10,2I3,3I25,E25.16)
10500 FORMAT(5E25.16)
10600 FORMAT(E25.16)
10700 FORMAT(E25.16,2I25,2E25.16)
10800 FORMAT(2I25,3E25.16)
10801 FORMAT(I25,3E25.16)
10900 FORMAT(E25.16,2I25,E25.16,I25,I1)
11000 FORMAT(4E25.16)
11100 FORMAT(4E25.16,I25)
11200 FORMAT(2I25)
11300 FORMAT(E25.16,2I11,E25.16,3I11,I2,E25.16)
11400 FORMAT(5I11,12I6)
11500 FORMAT(12I11)
90001 FORMAT(1X,'*** ERROR AND ABNORMAL TERMINATION *** IFORM IS '
     .       ,'IMPROPER; IFORM=',I3)
90300 FORMAT(1X,'*** ERROR AND ABNORMAL TERMINATION *** UNEXPECTED '
     .       ,'END OF FILE ENCOUNTERED')
99999 FORMAT(1X,'*** NORMAL TERMINATION OF PROGRAM ***',/,
     .       1X,'***     VERSION NUMBER: 9201      ***')
      END
