//Author - Evan Osborn
//Assignment 2 - buildroot
#include <stdbool.h>
#include <syslog.h>
#include <string.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <libgen.h>
#include <dirent.h>

int main(int arg1, char** argu){
	int file = open(argu[1], O_RDWR | O_CREAT, S_IRUSR | S_IWUSR | 		S_IRGRP | S_IWGRP | S_IROTH);
	if(arg1 != 3){
		syslog(LOG_USER | LOG_ERR, "invalid input args");
		closelog();
		return 1;
	}
	
	if(file == -1)
	{
		syslog(LOG_USER | LOG_ERR, "Error with %s", argu[1]);
		closelog();
		return 1;
	}
	
	write(file, argu[2], strlen(argu[2]));
	close(file);
	
	return 0;
}

