#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
	// Setting up syslog
	openlog(NULL, 0, LOG_USER);
	
	// Checking the arguments
	if (argc != 3)
	{
		syslog(LOG_ERR, "Invalid number of arguments: %d.", argc);
		// fprintf(stderr, "Error: Invalid number of arguments.\nTwo arguments required, in this order: <writefile>, <writestr>.\n");
		closelog();
		return 1;
	}
	
	const char *writefile = argv[1];
	const char *writestr = argv[2];
	
	// Logging debug message
	syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
	
	// Attempting to open the file
	FILE *output_file = fopen(writefile, "w");
	if (output_file == NULL)
	{
		// fprintf(stderr, "Error: Failed to open file %s.\n", writefile);
		syslog(LOG_ERR, "Failed to open file %s.", writefile);
		fclose(output_file);
		closelog();
		return 1;
	}
	
	// Writing into the file
	if (fprintf(output_file, "%s", writestr) < 0)
	{
		// fprintf(stderr, "Error: Failed to write to the output file %s.\n", writefile);
		syslog(LOG_ERR, "Failed to write to the output file %s.", writefile);
		fclose(output_file);
		closelog();
		return 1;
	}
	
	// Closing the output file and the log normally
	fclose(output_file);
	closelog();
	
	return 0;
}
