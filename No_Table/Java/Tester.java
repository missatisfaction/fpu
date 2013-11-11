import java.io.*;
import java.util.Random;

public class Tester {

  public static void main(String[] args) {

    for ( int i = 0; i < 10000; i++ ) {
      float a = random_float();
      float b = random_float();
      if ( !check_float( a, b ) ) {
        System.out.println( "失敗" );
        return; 
      } 
    }
    System.out.println( "成功" );
  }

  private static float random_float() {
    Random r = new Random(); 
    int k = r.nextInt(50);
    double d = r.nextDouble();  
    if ( r.nextBoolean() ) {
      return (float)( k * d );
    } else {
      return - (float)( k * d );
    }
  }

  private static boolean check_float( float a, float b ) {

    int a_int = Fpu.getUint32_t( a );
    int b_int = Fpu.getUint32_t( b );
    int sqrt  = Fpu.getUint32_t( (float)Math.sqrt( a ) );
    int fsqrt = Fpu.fsqrt( a_int );
    int inv   = Fpu.getUint32_t( (float)(1.0 / a) );
    int finv  = Fpu.finv( a_int );
    int div   = Fpu.getUint32_t( a / b );
    int fdiv  = Fpu.fdiv( a_int, b_int );
    return sqrt == fsqrt && inv == finv && div == fdiv; 
  }

}
