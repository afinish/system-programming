//SP Lab 2 - Problem 18
//Jahongir Rakhimjonov U1910138
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>

int main()
{
    char input_str[64], //input string
        whole_str[64],  //string for the whole part
        fract_str[64];  //string for the fractional part
        
    int whole_binary_str_reverse[32], 
        whole_binary_str[32], 
        fract_binary_str[23], 
        exponent_binary_str_reverse[8], 
        exponent_binary_str[8], 
        output_binary[31], 
        output_binary_reverse[31],
        tmpr[32],
        hex_option[32], // ??
        output_binary_length, input_str_length, 
        length, fract_num_size, exponent,
        factor_hex = 1000,
        factor_fract = 10,
        factor_whole = 1,
        counter_whole = 0,
        whole_int = 0,
        sign = 0,
        
        i, j, k;
    long int hex = 0;
    float tmp, fract_float = 0.0;
    
    //Program input
    printf("Enter Real number in Decimal form:");
    scanf("%s", input_str);
    input_str_length = strlen(input_str);

    if(input_str[0] == 45) {                //if there's a minus sign ('45' = '-' ASCII)
        sign = 1;                           //change the sign to 1, means minus
        for(i=0; i<input_str_length; i++)   //then shift input_str rigth by one bit 
            input_str[i] = input_str[i+1];
        input_str[input_str_length - 1] = 0;//turning the first character to '0' 
    }
    
    char short_input_str[input_str_length]; //shortened input_str without
    for (i=0; i<input_str_length; i++) {     //empty bits;
        short_input_str[i] = input_str[i];  //getting rid of empty space;
    }
    //deviding input_str into fractional and whole part
    for(j=0; j<i; j++){                     
        if (short_input_str[j] == 46) {     //when ('.'='46'ASCII) is found
            for (k=j+1; k<i; k++)           //take numbers after '.' as fractional part
                fract_str[k] = short_input_str[k];
            break;
        } whole_str[j] = short_input_str[j];//till '.' is found keep storing in whole_str
    }
    //getting rid of '.N=' output bug
    char fract_str_short[strlen(fract_str)];                             
    for(i=0;i<strlen(fract_str);i++) {
        fract_str_short[i] = fract_str[i+3];
    }
    //converting whole_str(whole part) from char array to int
    for(i=strlen(whole_str)-1; i>=0; i--){
        whole_int += (factor_whole * (whole_str[i] - '0'));
        factor_whole = factor_whole * 10;
    }
    /*converting whole part from int to binary array, 
    and storing it in whole_binary_str_reverse*/
    for (i=0; whole_int > 0; i++){ 
        whole_binary_str_reverse[i] = whole_int % 2;
        whole_int /= 2;
    }
    //reversing whole_binary_str_reverse
    length = sizeof(whole_binary_str_reverse)/sizeof(whole_binary_str_reverse[0]);
    for(j=0; j < length; j++) {
        whole_binary_str[j] = whole_binary_str_reverse[length - j - 1]; 
    }
    //storing whole_binary_str in tmpr array without first number 
    for(i = length - i; i < length; i++) {
        tmpr[length - i] = whole_binary_str[i];
        counter_whole++;
    }
    //storing tmpr in binary_output after 8 bits
    for (i=0; i < counter_whole; i++){
        output_binary[i + 7] = tmpr [counter_whole - i];
    }
    //converting fract_str_short(fractional part) from char array to float
    for(i=0; i<strlen(fract_str_short); i++) {
        fract_float += ((float)(fract_str_short[i] - '0')/factor_fract);
        factor_fract *= 10;
    }
    //storing binary of fract_float(fractional part) in fract_binary_str
    for (i=0; fract_float != 0.0;i++) {
        fract_float *= 2;
        if (fract_float >= 1){
            fract_binary_str[i] = 1;
            fract_float -= 1;
        } else 
            if(fract_float > 0 && fract_float < 1)
                fract_binary_str[i] = 0;
            else break;
    } int fract_length = i ;
    /*assigning values of fract_binary_str (fractional part)
    to output_binary (binary program output)*/
    for(j=0; j < fract_length; j++) {
        output_binary[j + counter_whole + 7] = fract_binary_str[j];
    }
    //calculating exponent and storing it's binary in exponent_binary_str_reverse array
    exponent = 126 + counter_whole;
    for (i=0; exponent > 0; i++) {
        exponent_binary_str_reverse[i] = exponent % 2;
        exponent /= 2;
    }
    //reversing array exponent_binary_str_reverse
    length = sizeof(exponent_binary_str_reverse)/sizeof(exponent_binary_str_reverse[0]);
    for(j=0; j < length; j++) {
        exponent_binary_str[j] = exponent_binary_str_reverse[length - j - 1];
    }
    /*assigning values of exponent_binary_str (binary of exponent)
    to output_binary (binary program output)*/
    for(i=0; i < 8; i++) {
        output_binary[i] = exponent_binary_str[i];
    }
    /*assigning '0' values to empty bits 
    of output_binary (binary program output)*/
    for(k=counter_whole + fract_length + 7; k < 32; k++) {
        output_binary[k] = 0;
    }
    
    printf("\nReal number in IEEE 754 Single precision floating point form\n");
    printf("Binary form = %d", sign);//Binary output
    for(i=0; i<31; i++) printf("%d", output_binary[i]);
    printf("\n");
    k = 0;
    int array[32];
    array[0] = sign;
    for(i=1; i<32; i++) {
        array[i] = output_binary[k];
        k++;
    }
    //Reversing output_binary and storing it in output_binary_reverse
    for(i=0; i<32; i++) {
        output_binary_reverse[i] = array[31 - i];
    }
    
    for (i=0; i<32; i++) {          //Turning binary_output to decimal *
        if (output_binary_reverse[i] == 1) 
            hex += pow(2, i);
    }
    for(i=0; hex > 0; i++) {
        hex_option[i] = hex % 16;
        hex /= 16;
    }
    
    printf("Packed Hex form = 0x"); //Hexadecimal Output
    for(j=i - 1; j>=0; j--) {
        switch(hex_option[j]) {
            case 10: printf("A"); break;
            case 11: printf("B"); break;
            case 12: printf("C"); break;
            case 13: printf("D"); break;
            case 14: printf("E"); break;
            case 15: printf("F"); break;
            default: printf("%d", hex_option[j]); break;}
    }
    printf("\n");
    return 0;
}
