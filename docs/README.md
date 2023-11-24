# Documentation

This is hand-written documentation, used to indicate what is needed to do
later, and where the current project is at.

This documentation may not stay up to date, this project may disappear,
or the current documentation may later be replaced by automatic documentation
tool (like Doxygen).

## General overview

The goal of this project is just for me to hone my skills, and do not
intent to be a revolution in the informatic, other mathematic domains.

The codebase is in `C`, with some `Makefile` for the automation. Some
other technologies may be used later, but I first intent to reinvent the
wheel, as it is first a project to learn.

## Language synthax

## Project structure

This is how I think I will build the project:

```cmd
root/
|-- main.c
|-- Makefile
|-- cli/
|   |-- colors/
|   |-- options/
|   |-- parser/
|   |-- strings/
|-- docs/
|-- maths/
|-- polynomials/
|-- store/
```

* `main.c`: the input of the program
* `Makefile`: for the automation of the compilation
* `cli/`: all CLI related code
* `cli/colors/`: the colors in the CLI
* `cli/option/`: to print some useful information (`help`, `license` and so on)
* `cli/parser/`: understands the user intentions
* `cli/strings/`: needed by `cli/colors/`
* `docs/`: this documentation
* `maths/`: any useful mathematical code that may replace the `math.h` file
* `polynomials/`: the code to manipulate polynomials
* `store/`: a hand-made vector to store and delete the saved polynomials
