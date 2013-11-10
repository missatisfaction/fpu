#include "fpu.h"

uint32_t float_with( sign, exp, frac ){
  uint32_t retVal = (frac & 0x007FFFFF);
  retVal += exp << 23;
  retVal += sign << 31;
  return retVal;
}

uint32_t fsqrt( uint32_t a) {
  int frac = 0;
  int mod = 0;
  int exp = 0;
  int sign1 = a >> 31;
  int frac1 = a & 0x007FFFFF;
  int exp1 = ( a & 0x7F800000 ) >> 23;
 
  int j = 0;

  if (exp1 == 0) {
    return float_with( sign1, 0, 0 );  
  } else if ( sign1 == 1 ) {
    // 2 ** 22
    return float_with( 1, 255, 4194304 );
  }

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
  
  if((frac&0x1) == 1 && (mod > 0 || (frac&0x2) > 0)) frac += 2;

  frac = frac >> 1;
  exp = exp - 1;

  uint32_t retVal = (frac & 0x007FFFFF);
  retVal += exp << 23;

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
    return float_with( sign, 255, 0 );
  } else if ( exp1 == 0 ) {
    return 0;
  }

  frac = ((unsigned long long)(0x800000 + frac1) << 25) / (unsigned long long)(0x800000 + frac2);
  mod = ((unsigned long long)(0x800000 + frac1) << 25) % (unsigned long long)(0x800000 + frac2);
  exp = exp1 - exp2 + 127;

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
