#include "cli/colors/colors.h"
#include "cli/options/options.h"
#include "polynomials/polynomials.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <sys/stat.h>

/// Check whether a file truly exists
///
/// \param filename The relative path to the file
/// \returns Whether the file exists
bool fexist(char* filename) {
	struct stat buffer;
	return (stat(filename, &buffer) == 0);
}

int main(int argc, char *argv[])
{
	if (argc == 1) {
		// We launch the REPL

		print_header();
	} else if (argc == 2) {
		// We need to interpret a file
		// so we check whether the file exists

		char* filename = argv[1];
		if (!fexist(filename)) {
			print("[fg(red)][bold]ERROR:[/bold] ");
			print("The requested file '");
			print(filename);
			print("' was not found on this computer. Try again.");
			print("[/fg(red)]\n");

			return EXIT_FAILURE;
		}

		print("[italic][fg(magenta)](* Interpret file '");
		print(filename);
		print("' *)[/fg(magenta)][/italic]\n");
	} else {
		// Error

		print("[fg(red)][bold]ERROR:[/bold] ");
		print("The number of given parameters is abnormal.");
		print("[/fg(red)]\n\n");

		// Print help
		print_help();
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}
