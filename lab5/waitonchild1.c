#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
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
   
    int child_status;

    if (Fork() == 0) 
    {
        printf("HC: hello from child, pid=%d\n", getpid());
	exit(0);
    } 
    else 
    {
        printf("HP: hello from parent, pid=%d\n", getpid());
        wait(&child_status);
        printf("CT: child has terminated\n");
    }
    printf("Bye\n");

}
