#include "fpu.h"
#include <math.h>

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

void print_fsqrt( uint32_t a ) {
    uint32_t b = fsqrt( a );
    float af = getFloat(a);
    float bf = getFloat(b);
    printf("実装したfsqrt\n");
    printf("小数表示 fsqrt( %f ) = %f\n", af, bf );
    printf("10進数表示 fsqrt( %d ) = %d\n", a, b );
    printf("16進数表示 fsqrt( %x ) = %x\n", a, b );
}

void print_normalsqrt( uint32_t a ) {
    float af = getFloat(a);
    float bf = sqrt( af );
    uint32_t b = getUint32_t(bf);
    printf("通常のsqrt\n");
    printf("小数表示 sqrt( %f ) = %f\n", af, bf );
    printf("10進数表示 sqrt( %d ) = %d\n", a, b );
    printf("16進数表示 sqrt( %x ) = %x\n", a, b );
}

void print_finv( uint32_t a ) {
    uint32_t b = finv( a );
    float af = getFloat(a);
    float bf = getFloat(b);
    printf("実装したfinv\n");
    printf("小数表示 finv( %f ) = %f\n", af, bf );
    printf("10進数表示 finv( %d ) = %d\n", a, b );
    printf("16進数表示 finv( %x ) = %x\n", a, b );
}

void print_normalinv( uint32_t a ) {
    float af = getFloat(a);
    float bf = 1.0 / af;
    uint32_t b = getUint32_t(bf);
    printf("通常のinv\n");
    printf("小数表示 inv( %f ) = %f\n", af, bf );
    printf("10進数表示 inv( %d ) = %d\n", a, b );
    printf("16進数表示 inv( %x ) = %x\n", a, b );
}

int main(int argc, char const* argv[])
{
    /*
    printf("16進数を入力してください : ");
    scanf("%x", &a);
    printf("16進数を入力してください : ");
    scanf("%x", &b);
    */

    float f;
    printf("小数を入力してください \n");
    scanf("%f", &f);
    uint32_t a = getUint32_t(f);
    print_normalsqrt(a );
    print_fsqrt(a);
    print_normalinv(a);
    print_finv(a);
    return 0;
}
