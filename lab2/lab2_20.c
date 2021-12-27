//SP Lab 2 - Problem 20
//Jahongir Rakhimjonov U1910138
#include <stdio.h>

int main() {
    int int_num, endianness = 1;
    float float_num;
    double double_num;
    char str_num[32];
    
    //getting all the data from the user keyboard
    printf("Enter an Integer Number: ");
    scanf("%d", &int_num);
    printf("Enter a single floating point data: ");
    scanf("%f", &float_num);
    printf("Enter a double precision floating point data: ");
    scanf("%lf", &double_num);
    printf("Enter a string of characters: ");
    scanf("%s", str_num);
    
    //displaying addresses of the locations in hex
    printf("Integer: %p\n",&int_num);
    printf("Float: %p\n",&float_num);
    printf("Double: %p\n",&double_num);
    printf("String: %p\n",&str_num);
    
    //checking whether the system is Big-endian or little-endian
    if(*(char *)&endianness == 1) {
        printf("Your system is Little-endian\n");
    } else printf("Your system is Big-endian\n");
}
