#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <unistd.h>
#include <signal.h>
#include <errno.h>

void handler(int sig) 
 {
     static int i, beeps = 0;

     printf("BEEP\n"); 
     if(++beeps <8)
       {
        printf("ALARM  FIRED IN SIGINT HANDLER \n Next SIGALRM will be delivered in 1s to Main\n");
	alarm(1); 
	/* Next SIGALRM will be delivered in 1 second */ 
       }
       else
       { 
           printf("BOOM!\n");
            exit(0); 
        } 
 } 

int main()
{
	/* Install SIGALRM handler */ 
  	  signal(SIGALRM, handler); 
	  printf("HANDLER SIGALRM INSTALLED \n");
          printf("ALARM  FIRED IN MAIN \n Next SIGALRM will be delivered in 1s to Main \n");
          alarm(1); 
            /* Next SIGALRM will be delivered in 1s */ 
          
	 while (1) {

		
            ; 
          	/* Signal handler returns control here each time */ 
           } 
          exit(0);

}
