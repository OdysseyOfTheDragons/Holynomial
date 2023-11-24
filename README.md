# Holynomial
An interpreted language to play with polynomials.

The brand new mathematical language. One you will love.

## Language features

* Easily create polynomials
* Derive your polynomials
* Evaluate your polynomials
* Multiply, add...
* List your polynomials
* Load `.hnm`  file to evaluate (as a standalone program)

## Language style

1. Create a polynomial
```c
$ define polynomial = create (0 1 2)
POLYNOMIAL: polynomial = 2x^2 + x
```
2. Derive
```c
$ derive (polynomial)
POLYNOMIAL: () = 4x + 1
$ define holynomial = derive (derive (polynomial))
POLYNOMIAL: holynomial = 4
```

3. Print
```c
$ print (holynomial)
POLYNOMIAL: holynomial = 4
```

5. Multiply/add...
```c
$ add (create (2 2 2)) (create (3 2 1 0))
POLYNOMIAL: 3x^2 + 4x + 5
$ multiply (create (2 2 2)) (multiply (create (1)) (create (2)))
POLYNOMIAL: 4x^2 + 4x + 4
```

7. List your polynomials
8. Chain instructions
