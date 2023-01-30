FFLAGS  = -Wall -Wimplicit
CFLAGS  = -Wall -Wimplicit
FEXTSRC = -ffixed-line-length-none
RECUR   = -qrecur
CPLUS	=
MATHLIB = -llapack -lblas
SHARED_LD       = ld -shared --whole-archive -fPIC -melf_i386
SHARED_LIB_LIBS =#
SHARED_EXT	= so
PGPLOT	= -L$(ALTIM)/lib -lpgplot -L/usr/X11R6/lib -lX11 -lpng
PMPLOT	= -L$(ALTIM)/lib -lpmplot -L/usr/X11R6/lib -lX11 -lpng
F90	= f90
