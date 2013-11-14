import java.io.*;
import java.util.Random;

public class Tester {

  public static void main(String[] args) {

    for ( int i = 0; i < 10000; i++ ) {
      float a = random_float();
      if ( !check_float( a ) ) {
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

  private static boolean check_float( float a ) {

    int a_int = Fpu.getUint32_t( a );
    return Fpu.is_valid_fsqrt( a_int ) && Fpu.is_valid_finv( a_int ); 
  }

}
