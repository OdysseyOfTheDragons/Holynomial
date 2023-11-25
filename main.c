#include <stdlib.h>

int main(int argc, char* argv[]) {
	if (argc == 1) {
		// We launch the REPL
	} else if (argc == 2) {
		// We need to interpret a file
		// so we check whether the file exists
	} else {
		// An error in the CLI usage, so we use `cli/options/`
		// to print the program usage
	}

	return EXIT_SUCCESS;
}
