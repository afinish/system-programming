#include <stdio.h>
#include <string.h>
#include <setjmp.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <unistd.h>
#include <signal.h>
#include <errno.h>

jmp_buf  buf;

void handler(int sig)
{
    longjmp(buf, 1);
}

int main()
{
    if (!setjmp(buf)) 
    {
        signal(SIGINT, handler);
	puts("starting\n");
    }
    else
           puts("restarting\n");

    while(1) {
	sleep(1);
	puts("processing...\n");
    }
    exit(0); /* Control never reaches here */
}
