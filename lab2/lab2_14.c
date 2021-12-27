//SP Lab 2 - Problem 14
//Jahongir Rakhimjonov U1910138
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>

int main(){
    char rb_str[32];
    int rm[16], m[16], hex[16];
    int i, j, k, b_length, rm_length, rem;
    long int 
    b2u = 0, 
    b2s = 0, 
    b2o = 0, 
    b2t = 0, 
    oct = 0;

    printf("Enter a Binary Number:");
    scanf("%s", rb_str);
    b_length = strlen(rb_str);
    char b_str[b_length];
    
    //reverse the string
    for(i=0; i<b_length; i++) b_str[i] = rb_str[b_length - i - 1];
    //B2U-----------------------------------------------------------------------
    for (i=0; i<b_length; i++) if (b_str[i] == 49) b2u += pow(2, i); 
    printf("B2U(%s) = %ld\n", rb_str, b2u);
    //B2S-----------------------------------------------------------------------
    for (i=0; i<b_length - 1; i++) if (b_str[i] == 49) b2s += pow(2, i);
    if (b_str[b_length - 1] == 49) b2s *= -1;
    printf("B2S(%s) = %ld\n", rb_str, b2s);
    //B2O-----------------------------------------------------------------------
    for (i=0; i<b_length - 1; i++) if (b_str[i] == 49) b2o += pow(2, i);
    if (b_str[b_length - 1] == 49) b2o -= pow(2, b_length-1) - 1;
    printf("B2O(%s) = %ld\n", rb_str, b2o);
    //B2T-----------------------------------------------------------------------
    for (i=0; i<b_length - 1; i++) if (b_str[i] == 49) b2t += pow(2, i);
    if (b_str[0] == 49) b2t -= pow(2, b_length-1);
    printf("B2T(%s) = %ld\n", rb_str, b2t);
    //OCT-----------------------------------------------------------------------
    for (i=0; i<b_length; i++) if (b_str[i] == 49) oct += pow(2, i);
    for (i=0; oct != 0; i++) {
        rm[i]= oct % 8;
        oct /= 8;
    } 
    rm_length = sizeof(rm)/sizeof(rm[0]);
    for(j=0; j<rm_length; j++) m[j] = rm[rm_length - j - 1]; //reverse
    printf("OCT(%s) = ", rb_str);
    for(i=rm_length - i; i<rm_length; i++) if (m[i] != 0) printf("%d", m[i]);
    printf("\n");
    //HEX-----------------------------------------------------------------------
    printf("HEX(%s) = 0x", rb_str);
    for(i=0; b2u > 0; i++) {
        hex[i] = b2u % 16;
        b2u /= 16;
    }
    for(j=i - 1; j>=0; j--) {
        switch(hex[j]) {
            case 10: printf("A"); break;
            case 11: printf("B"); break;
            case 12: printf("C"); break;
            case 13: printf("D"); break;
            case 14: printf("E"); break;
            case 15: printf("F"); break;
            default: printf("%d", hex[j]); break;}
    }
	printf("\n");	
    return 0;
}
