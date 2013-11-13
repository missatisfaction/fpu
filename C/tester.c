#include "fpu.h"
#include <math.h>
#include <time.h>

int check_float( float a ) {
  uint32_t a_int = getUint32_t( a );
  return is_valid_fsqrt( a_int ) && is_valid_finv( a_int );
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
  for ( int i = 0; i < 100000; i++ ) {
    if ( !check_float( rand_float() ) ) {
      printf( "失敗\n" );
      return 0; 
    } 
  }
  printf( "成功\n" );
  return 0;
   
}
