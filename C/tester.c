#include "fpu.h"
#include <math.h>
#include <time.h>

int check_float( float a ) {
  uint32_t a_int = getUint32_t( a );
  float normal_f = (float)sqrt( a );
  uint32_t sqrt  = getUint32_t( normal_f );
  uint32_t f_sqrt = fsqrt( a_int );
  if ( sqrt != f_sqrt ) {
    printf("Fsqrt失敗\n数字 : %f\n", a);
    printf("通常 %x\n", sqrt );
    printf("自作 %x\n", f_sqrt );
  }
  uint32_t inv   = getUint32_t( (float)(1.0 / a ) );
  uint32_t f_inv  = finv( a_int );
  if ( inv != f_inv ) {
    printf("Finv失敗\n数字 : %f\n", a);
    printf("通常 %x\n", inv );
    printf("自作 %x\n", f_inv );
  }
  return sqrt == f_sqrt && inv == f_inv; 
}

int rand_float() {
  float f = (float)rand() / (float)rand();
  if ( (int)rand() % 2 == 0 ) {
    f *= -1; 
  } 
  return f;
}

int main(int argc, char const* argv[])
{
  srand((unsigned)time(NULL));
  int i;
  for ( int i = 0; i < 1000; i++ ) {
    if ( !check_float( rand_float() ) ) {
      printf( "失敗\n" );
      return 0; 
    } 
  }
  printf( "成功\n" );
  return 0;
   
}
