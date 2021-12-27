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

void handler(int sig) /* SIGQUIT handler */ 
{ 
	printf("Caught SIGQUIT\n"); 
	exit(0); 
} 

int main()
{
          /* Install the SIGQUIT handler */ 
	  printf("INSTALLED THE SIGQUIT HANDLER \n");
     	   if (signal(SIGQUIT, handler) == SIG_ERR) 
         	 unix_error("signal error"); 
  	  printf("WAITING FOR THE RECEIPT OF A SIGNAL SIGQUIT - PRESS ^\ \n");
	  pause(); /* Wait for the receipt of a signal */ 
	  exit(0); 
}
