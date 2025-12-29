#if defined N76E003
  /* for Keil */
  #if defined __C51__
  #include "n76e003_keil.h"

  /* for IAR */
  #elif defined __ICC8051__
  #include "n76e003_iar.h"

  /* for SDCC */
  #elif defined __SDCC__
  #include "n76e003_sdcc.h"
  #endif
#elif defined MS51FB9AE
  /* for Keil */
  #if defined __C51__
  #include "ms51_16k_keil.h"

  /* for IAR */
  #elif defined __ICC8051__
  #include "ms51_16k_iar.h"

  /* for SDCC */
  #elif defined __SDCC__
  #include "ms51_16k_sdcc.h"
  #endif
#else
  #error "Unknown MCU: define N76E003 or MS51FB9AE"
#endif

