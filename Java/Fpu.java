public class Fpu {

  public static float getFloat(int a) {
    return Float.intBitsToFloat(a);
  }

  public static int getUint32_t(float a) {
  
    return Float.floatToRawIntBits(a);
  }

  private static int float_with( int sign, int exp, int frac ) {
    int retVal = (frac & 0x007FFFFF);
    retVal += exp << 23;
    retVal += sign << 31;
    return retVal;
  }

  private static int[] parse_float( int a ) {
    int intArray[] = new int[3];
    intArray[0] = a >> 31;
    intArray[1] = ( a & 0x7F800000 ) >> 23;
    intArray[2] = a & 0x007FFFFF;
    return intArray; 
  }

  public static int fsqrt(int a) {
    int[] array = parse_float(a);

    int frac = 0;
    int mod = 0;
    int exp = 0;
    int sign1 = array[0];
    int exp1  = array[1]; 
    int frac1 = array[2];

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


    if((frac&0x1) == 1 && (mod > 0 || (frac&0x2) > 0)) frac += 2;

    frac = frac >> 1;
    exp = exp - 1;

    if(zero == 1) exp = 0;

    return float_with( 0, exp, frac );
  }

  public static int fdiv( int a, int b ) {
    int frac = 0;
    int mod = 0;
    int exp = 0;

    int[] array1 = parse_float( a );
    int[] array2 = parse_float( b );
    boolean sign1 = ( array1[0] == 1 );
    int exp1  = array1[1];
    int frac1 = array1[2];
    boolean sign2 = ( array2[0] == 1 );
    int exp2  = array2[1]; 
    int frac2 = array2[2];

    int sign = ( ( sign1 && !sign2 ) || (!sign1 && sign2 ) ) ? 1 : 0; 

    if (exp2 == 0) {
      exp = 255;
      frac = frac1;
      return float_with( sign, exp, frac );
    }
    long numerator   = (long)(0x800000 + frac1) << 25;
    long denominator = (long)(0x800000 + frac2); 

    frac = (int)(numerator / denominator);
    mod = (int)(numerator % denominator);
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

  public static int finv(int a) {
    return fdiv( getUint32_t( (float)1.0 ), a );
  }

}
