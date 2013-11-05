#include "fpu.h"

uint32_t fsqrt( uint32_t a) {
  int frac = 0;
  int mod = 0;
  int exp = 0;
  int sign1 = a >> 31;
  int frac1 = a & 0x007FFFFF;
  int exp1 = ( a & 0x7F800000 ) >> 23;
 
  int j = 0;
  int zero = 0;


  if (exp1 == 0) zero = 1;

  mod = 0x800000+ frac1;
  if ( exp1 % 2 == 0) {
    mod = mod << 1;
    exp = ( exp1 - 126)/2 + 127;
  } else {
    exp = ( exp1 - 125)/2 + 127;
  }

  while (j < 25) {
    if((mod << 1) > ( frac << 1) + (1 << (24 - j))) {
      mod = (mod << 1) - (frac << 1) - (1 << (24 - j));
      frac = frac + (1 << (24 - j));
    } else {
      mod = (mod << 1);
    }
    j++;
  }
  
  //仮数部の乗算が0.5以上

  if((frac&0x1) == 1 && (mod > 0 || (frac&0x2) > 0)) frac += 2;

  frac = frac >> 1;
  exp = exp - 1;

  if(zero == 1) exp = 0;

  frac = (int)(frac - 0x800000);

  uint32_t retVal = (frac & 0x007FFFFF);
  retVal += exp << 23;

  return retVal;
}
