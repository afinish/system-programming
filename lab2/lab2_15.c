//SP Lab 2 - Problem 15
//Jahongir Rakhimjonov U1910138
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
void dec2b(int);
void hex2b(int);
void oct2b(int);

int main(){
    int width, wid, decimal;
    char hex[64], oct[64];
    char num_system;
    
    printf("Enter width(in bits): ");
    scanf("%d", &width);    //user input width
    wid = width;            //variable to pass to functions
    printf("Which Number System (Enter d for decimal, o for Octal, x for hex): ");
    scanf("%s", &num_system);//user input type
    switch(num_system){
        case 'd': dec2b(wid); break;
        case 'o': oct2b(wid); break;
        case 'x': hex2b(wid); break;
        default: printf("\nError: False input! Try again\n"); break;
    }
    printf("\n");
    return 0;
}

//functions--------------------------------------------------------------------
void dec2b(int w) {     //decimal to binary function
    int r_dec[64], dec[64];
    int width, length, decimal;
    int i, j, d;
    
    printf("Enter Decimal Number: ");
    scanf("%d", &decimal); d = decimal;
    for (i=0; decimal > 0; i++) { //dec to binary
        r_dec[i] = decimal % 2;
        decimal /= 2;
    } width = i;
    if (w == width) {        //checks whether width match with user width
       length = sizeof(r_dec)/sizeof(r_dec[0]);
        for(j=0; j < length; j++) {
            dec[j] = r_dec[length - j - 1]; //reverse
        }
        printf("U2B(%d) = ", d);
        for(i = length - i; i < length; i++) {
            printf("%d", dec[i]); //display binary output
        }
    } else printf("Error: Wrong width! Try again");
}
void oct2b(int w) {     //octal to binary function
    char r_oct_str[64], oct_str[64];//strs for octal
    int r_binary[64], binary[64];   //arrays for binary
    int oct_length, binary_length;
    int i, j, tmp;
    int decimal = 0;
    
    printf("Enter Octal Number: ");
    scanf("%s", r_oct_str);     //user input oct string
    oct_length = strlen(r_oct_str);
    if (oct_length * 3 == w) {  //checks whether width match with user width
        for(i=0; i<oct_length; i++) {   //reversing r_oct_str string
            oct_str[i] = r_oct_str[oct_length - i - 1]; 
        }
        for (i=0; i<oct_length; i++) {  //hex to decimal
            tmp = oct_str[i] - '0';
            decimal += tmp * pow(8, i);
        }
        for (i=0; decimal>0; i++) {     //decimal to binary
            r_binary[i] = decimal%2;
            decimal /= 2;
        }
        binary_length = sizeof(r_binary)/sizeof(r_binary[0]);
        for(j=0; j<binary_length; j++) {//reversing r_binary array
        binary[j] = r_binary[binary_length - j - 1]; 
        }
        printf("Oct2B(%s) = ", r_oct_str);
        for(i=binary_length - i; i<binary_length; i++) {
            printf("%d", binary[i]);    //display binary output
        }
    } else {printf("Error: Wrong width! Try again");}
}
void hex2b(int w) {     //hexadecimal to binary function
    int i, width;
    char hex_str[64];
    
    printf("Entere Hexadecimal Number: ");
    scanf("%s", hex_str);//user input hex string
    width = strlen(hex_str);
    if(width * 4 == w){ //checks whether width match with user width
        printf("Hex2B(%s) = ", hex_str);
        for(i=0; i<width; i++) { //hex to binary
            switch(hex_str[i]) { //display binary output
                case '1': printf("0001"); break;
                case '2': printf("0010"); break;
                case '3': printf("0011"); break;
                case '4': printf("0100"); break;
                case '5': printf("0101"); break;
                case '6': printf("0110"); break;
                case '7': printf("0111"); break;
                case '8': printf("1000"); break;
                case '9': printf("1001"); break;
                case 'a': printf("1010"); break;
                case 'b': printf("1011"); break;
                case 'c': printf("1100"); break;
                case 'd': printf("1101"); break;
                case 'e': printf("1110"); break;
                case 'f': printf("1111"); break;
                default: break;   
            }
        }
        
    } else {printf("Error: Wrong width! Try again");}
}
