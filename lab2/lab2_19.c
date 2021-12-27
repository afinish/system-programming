//SP Lab 2 - Problem 19
//Jahongir Rakhimjonov U1910138
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>

int main()
{
    int hex_array_length = 16;
    char hex_str[hex_array_length];
    
    int hex_array[hex_array_length], ieee_binary[32], exponent_array[8], 
        binary_reverse[64], binary[64], mantissa_array[23],
        power, i, j, k,
        exponent_decimal = 0,
        mantissa_size = 31,
        hex_int = 0,
        sign = 1;
        
    float whole_float = 0.0,
        fract_float = 0.0,
        output_num;
    
    //assigning initial '0' values to ieee_binary (binary 754 IEEE)
    for(i=0; i<32; i++) ieee_binary[i] = 0; 
    
    printf("Enter a real number in Packed Hex form= 0x");
    scanf("%s", hex_str);   //user input hex string

    //converting hex_str (input hex) into int array (hex_binary)
    for(i=0; i<strlen(hex_str); i++) {
        switch(hex_str[i]) {
            case '0': hex_array[i] = 0; break;
            case '1': hex_array[i] = 1; break;
            case '2': hex_array[i] = 2; break;
            case '3': hex_array[i] = 3; break;
            case '4': hex_array[i] = 4; break;
            case '5': hex_array[i] = 5; break;
            case '6': hex_array[i] = 6; break;
            case '7': hex_array[i] = 7; break;
            case '8': hex_array[i] = 8; break;
            case '9': hex_array[i] = 9; break;
            case 'a': case 'A': hex_array[i] = 10; break;
            case 'b': case 'B': hex_array[i] = 11; break;
            case 'c': case 'C': hex_array[i] = 12; break;
            case 'd': case 'D': hex_array[i] = 13; break;
            case 'e': case 'E': hex_array[i] = 14; break;
            case 'f': case 'F': hex_array[i] = 15; break;
            default: hex_array[i] = 0; break;
        }
    }
    //convert hexadecimal (hex_array) into decimal (hex_int)
    for(j=0; j<i; j++) { 
        hex_int += hex_array[j] * pow(16, j);
    }
    //printf("%d\n", hex_int);
    
    //convert decimal (hex_int) to binary (binary)
    for (i=0; hex_int > 0; i++){    
        binary[i] = hex_int % 2;
        hex_int /= 2;
    }
    //assing binary (binary) to binary 754 IEEE (ieee_binary)
    for(j=3; j<i;j += 4) {
        for(k=0; k<4; k++) 
        ieee_binary[j - 3 + k]  = binary[j - k];
    }
    //check the sign of the binary (if '1' negative, else positive)
    if(ieee_binary[0] == 1) sign = -1;
    //assign exponent part of ieee_binary to eponent_array
    for(i=1; i<9; i++) {
        exponent_array[i - 1] = ieee_binary[i];
    }
    //assign mantissa part of ieee_binary to mantissa_array
    for(i=9; i<32; i++) {
        mantissa_array[i - 9] = ieee_binary[i];
    }
    //convert exponent_array to decimal (exponent_decimal)
    for (i=0; i<8; i++) {
        if (exponent_array[7 - i] == 1) 
            exponent_decimal += pow(2, i);
    }
    power = exponent_decimal - 127; //get power of exponent
    //ignore the bits with '0's at the end part of mantissa
    for(i=0; i<32; i++) {
        if (ieee_binary[31 - i] == 1) break;
    }
    mantissa_size = 24 - i;
    int fract_array[mantissa_size];
    int whole_array[power + 1];
    whole_array[0] = 1;
    //devide mantissa into whole part and decimal part binaris
    for(i=1; i<=power; i++) {//whole part binary is till dot (power)
        whole_array[i] = mantissa_array[i - 1];
    }
    //fractional part binary is after dot (power)
    for(i=power; i<mantissa_size; i++) {
        fract_array[i - power] = mantissa_array[i];
    }
    //getting whole part in float
    for (i=0; i<=power; i++) {
        if (whole_array[power - i] == 1) 
            whole_float += pow(2, i); 
    }
    //getting fractional part in float
    for (i=0; i<=mantissa_size; i++) {
        if (fract_array[power - i] == 1) 
            fract_float += 1/pow(2, i); 
    }
    //assinging the sign of the real number
    output_num = sign * (whole_float + fract_float);
    //display real number in decimal form (output_num)
    printf("Real number in Decimal form: %f\n", output_num);
    return 0;
}
