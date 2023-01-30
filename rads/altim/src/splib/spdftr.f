**SPDFTR -- Forward/Reverse Discrete Fourier Transform (DFT) of Real data.
*+
      SUBROUTINE SPDFTR (X, Y, N, ISIGN)
      INTEGER*4  N, ISIGN
      REAL*8     X(0:N-1)
      COMPLEX*16 Y(0:N/2)
*  or REAL*8     Y(0:N+1)
*
* This routine computes the DFT of a series of N equally spaced real data points
* X(0) through X(N-1), or the performs the reverse operation.
* The Discrete Fourier Transform of X is stored in array Y, which may not be the
* same as array X. The real part of the COMPLEX*16 elements Y(0) [frequency = 0]
* through Y(N/2) [Nyquist frequency] are the cosine components of the DFT; the
* imaginary parts are the sine components. When interpreted as a REAL*8 array,
* Y(0) through Y(N+1) are the respective cosine and sine components of the DFT.
* Use ISIGN=-1 for the forward DFT, ISIGN=+1 for the reverse DFT.
* When the reverse DFT is computed, Y is transformed back into N data points X
* scaled by a factor N.
* The number of data points may be even or odd, but must be at least 2.
*
* Arguments:
*   N      (input): Number of data points.
*   ISIGN  (input): = -1 for forward DFT.
*       X  (input): Real values of the N data points.
*       Y (output): Discrete Fourier Transform of X.
*   ISIGN  (input): = +1 for reverse DFT.
*       X (output): Real values of the N data points scaled by a factor N.
*       Y  (input): Discrete Fourier Transform of X.
*-
* This subroutine was taken from "Signal Processing Algorithms;
* by Samuel D. Stearns and Ruth A. David, Prentice-Hall Inc., Englewood Cliffs,
* New Jersey, 1988" and was adjusted by Remko Scharroo, DUT/SOM.
*-
* 11-Mar-1991: Created, new manual, double precision implemented, forward and
*              inverse DFT combined.
*  2-Jul-1993: Standardize manual.
*------------------------------------------------------------------------------
      INTEGER*4 K,M
      COMPLEX*16 TPJN
      TPJN=DCMPLX(0D0,8*ISIGN*ATAN(1D0)/N)
      IF (ISIGN.LT.0) THEN
         DO M=0,N/2
            Y(M)=X(0)
            DO K=1,N-1
               Y(M)=Y(M)+X(K)*EXP(TPJN*K*M)
            ENDDO
         ENDDO
      ELSE
         DO K=0,N-1
            X(K)=DBLE(Y(0)+Y(N/2)*(-1)**K)
            DO M=1,N/2-1
               X(K)=X(K)+2*DBLE(Y(M)*EXP(TPJN*K*M))
            ENDDO
         ENDDO
      ENDIF
      END
