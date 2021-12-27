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

void handler(int sig) /* SIGINT handler */ 
{ 
	printf("Caught SIGINT\n"); 
	exit(0); 
} 

int main()
{
          /* Install the SIGINT handler */ 
	   printf("INSTALLED THE SIGNIT HANDLER \n");
     	   if (signal(SIGINT, handler) == SIG_ERR) 
         	 unix_error("signal error"); 
	   printf("WAITING FOR THE RECEIPT OF A SIGNAL SIGINT - PRESS ^C \n");
	   pause(); /* Wait for the receipt of a signal */ 
	   exit(0); 
}
