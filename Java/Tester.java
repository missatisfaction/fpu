import java.io.*;

public class Tester {

  public static void main(String[] args) {
    float f;
    System.out.print("input float: ");
    InputStreamReader isr = new InputStreamReader(System.in);
    BufferedReader br = new BufferedReader(isr);
    try{
      String buf = br.readLine();
      f = Float.parseFloat(buf);
    }catch(Exception e){
      f = 0;
    }
    System.out.println("Input Number = " + f);
    int f_int = Fpu.getUint32_t( f );
    print_normalsqrt( f_int );
    print_fsqrt( f_int );
    print_normalinv( f_int );
    print_finv( f_int );
  }

  private static void print_fsqrt( int a ) {
    int b = Fpu.fsqrt( a );
    float af = Fpu.getFloat(a);
    float bf = Fpu.getFloat(b);
    System.out.println("my fsqrt");
    System.out.println("小数表示 fsqrt( " + af + " ) = " + bf );
    System.out.println("10進数表示 fsqrt( " + a + " ) = " + b );
    System.out.println("16進数表示 fsqrt( " + Integer.toHexString( a ) + " ) = " + Integer.toHexString( b ) );
  }

  private static void print_normalsqrt( int a ) {
    float af = Fpu.getFloat(a);
    float bf = (float)Math.sqrt( af );
    int b = Fpu.getUint32_t(bf);
    System.out.println("通常のsqrt");
    System.out.println("小数表示 sqrt( " + af + " ) = " + bf );
    System.out.println("10進数表示 sqrt( " + a + " ) = " + b );
    System.out.println("16進数表示 sqrt( " + Integer.toHexString( a ) + " ) = " + Integer.toHexString( b ) );
  }

  private static void print_finv( int a ) {
    int b = Fpu.finv( a );
    float af = Fpu.getFloat(a);
    float bf = Fpu.getFloat(b);
    System.out.println("my finv");
    System.out.println("小数表示 finv( " + af + " ) = " + bf );
    System.out.println("10進数表示 finv( " + a + " ) = " + b );
    System.out.println("16進数表示 finv( " + Integer.toHexString( a ) + " ) = " + Integer.toHexString( b ) );
  }

  private static void print_normalinv( int a ) {
    float af = Fpu.getFloat(a);
    float bf = (float)1.0 / af;
    int b = Fpu.getUint32_t(bf);
    System.out.println("通常のinv");
    System.out.println("小数表示 inv( " + af + " ) = " + bf );
    System.out.println("10進数表示 inv( " + a + " ) = " + b );
    System.out.println("16進数表示 inv( " + Integer.toHexString( a ) + " ) = " + Integer.toHexString( b ) );
  }

}
