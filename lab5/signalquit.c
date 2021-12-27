#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <signal.h>
#include <unistd.h>
#include <errno.h>

void unix_error(char *msg) /* Unix-style error */
{
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}

pid_t Fork(void)
{
    pid_t pid;

    if ((pid = fork()) < 0)
        unix_error("Fork error");
    return pid;
}

int main()
{
   	pid_t pid; 

	/* Child sleeps until SIGQUIT signal received, then dies */ 

	if ((pid = Fork()) == 0) 
        {
		printf("waiting for signal SIGQUIT FROM PARENT in child \n");
		fflush(stdout);
 		pause(); /* Wait for a signal to arrive */ 
 		printf("control should never reach here!\n"); 
 		exit(0); 
	}


	/* Parent sends a SIGQUIT signal to a child */ 
	sleep(5);
        printf("PARENT NOW SENDING A SIGQUIT SIGNAL TO CHILD \n");
 	kill(pid, SIGQUIT); 
	exit(0);

}
