#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <unistd.h>
#include <signal.h>
#include <errno.h>

void unix_error(char *msg) /* Unix-style error */
{
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}

void handler(int sig) /* SIGSTP handler */ 
{ 
	printf("Caught SIGSTP\n"); 
	exit(0); 
} 

int main()
{
          /* Install the SIGSTP handler */ 
	  printf("INSTALLED THE SIGSTP HANDLER \n");
     	   if (signal(SIGSTP, handler) == SIG_ERR) 
         	 unix_error("signal error"); 
  	  printf("WAITING FOR THE RECEIPT OF A SIGNAL SIGSTP - PRESS ^Z \n");
	  pause(); /* Wait for the receipt of a signal */ 
	  exit(0); 
}
