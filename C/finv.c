#include "fpu.h"

uint32_t float_with( sign, exp, frac ){
  uint32_t retVal = (frac & 0x007FFFFF);
  retVal += exp << 23;
  retVal += sign << 31;
  return retVal;
}

uint32_t fdiv( uint32_t a,uint32_t b){
  int frac = 0;
  int mod = 0;
  int exp = 0;
  int sign1 = a >> 31;
  int exp1  = ( a & 0x7F800000 ) >> 23;
  int frac1 = a & 0x007FFFFF;
  int sign2 = b >> 31;
  int exp2  = ( b & 0x7F800000 ) >> 23;
  int frac2 = b & 0x007FFFFF;

  int sign = ( sign1 && !sign2 ) || (!sign1 && sign2 ); 
  
  if (exp2 == 0) {
    exp = 255;
    frac = frac1;
    return float_with( sign, exp, frac );
  }

  frac = ((unsigned long long)(0x800000 + frac1) << 25) / (unsigned long long)(0x800000 + frac2);
  mod = ((unsigned long long)(0x800000 + frac1) << 25) % (unsigned long long)(0x800000 + frac2);
  exp = exp1 - exp2 + 127;
  if (exp1 == 0) exp = 0;

  if (frac < 0x2000000) {
    if ( ( frac & 0x1 ) == 1 && ( mod > 0 || ( frac & 0x2 ) > 0 ) ) frac += 2;
    if ( frac < 0x2000000 ) {
      frac = frac >> 1;
      exp = exp - 1;
    } else {
      frac = frac >> 2;
    }
  } else {
    if( ( frac & 0x3 ) > 2 || ( ( frac & 0x3 ) == 2 && ( mod > 0 || ( frac & 0x4 ) > 0) ) ) frac += 4;
    frac = frac >> 2;
  }
  return float_with( sign, exp, frac );
}

uint32_t finv( uint32_t a ) {  
  return fdiv( 1065353216, a );
}
