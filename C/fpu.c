#include "fpu.h"
#include "table.h"

union IntAndFloat {
    uint32_t i;
    float f;
};

uint32_t getUint32_t( float val ) {
    union IntAndFloat a;
    a.f = val;
    return  a.i;
}

float getFloat( uint32_t val ) {
    union IntAndFloat a;
    a.i = val;
    return  a.f;
}

uint32_t float_with( sign, exp, frac ){
  uint32_t retVal = (frac & 0x007FFFFF);
  retVal += exp << 23;
  retVal += sign << 31;
  return retVal;
}

int sign_with_pointer( uint32_t a, int* exp, int* frac ) {
  *frac = a & 0x007FFFFF;
  *exp = ( a & 0x7F800000 ) >> 23;
  return a >> 31;
}

uint32_t fsqrt(uint32_t a) {

  int exp1, frac1;
  int sign1 = sign_with_pointer( a, &exp1, &frac1 );

  if (exp1 == 0) {
    return float_with( sign1, 0, 0 );  
  } else if ( sign1 == 1 ) {
    // 2 ** 22
    return float_with( 1, 255, 4194304 );
  }

  int key = ( 0x800000 + frac1 ) >> 14;
  int comp;
  int exp;
  if ( exp1 % 2 == 0 ) {
    comp = ( frac1 & 0x3FFF) << 1;
    exp = ( exp1 - 126)/2 + 127;
  } else {
    key = key >> 1;
    comp = frac1 & 0x7FFF;
    exp = ( exp1 - 125 ) / 2 + 127;
  }

  key -= 256;

  int frac = tb_sqrt_val[key] << 2;
  comp = comp * (tb_sqrt_tan[key]);
  frac += comp >> 12;

  if ( frac % 4 == 3 || frac % 8 == 6 || ( frac % 4 == 2 && ( comp & 0xFFF ) != 0 )) frac += 4;

  return float_with( 0, exp - 1, frac >> 2 );
}

uint32_t finv(uint32_t a){

  int exp1, frac1;
  int sign1 = sign_with_pointer( a, &exp1, &frac1 );

  int key = frac1 >> 13;
  int frac = tb_finv_val[key];
  int exp;

  if ( frac != 0) {
    frac += 0x800000;
  } else {
    frac = 0x1000000;
  }
  
  int comp = ( tb_finv_tan[key] * ( frac1 & 0x1FFF ) );
  frac -= comp >> 11;
  if ( ( comp & 0x3FF ) != 0) frac -= 1;
  if ( ( frac1 & 0x1F00 ) <= 0x1500 && ( frac1 & 0x1F00 ) >= 0x0F00) frac -= 1;

  if ( frac > 0xFFFFFF ) {
    exp = 254 - exp1;
    frac = frac >> 1;
  } else {
    exp = 253 - exp1;
  }

  if (exp > 255) {
    exp = 0;
    frac = 0;
  } 
  return float_with( sign1, exp, frac );
}
