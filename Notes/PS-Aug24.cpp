Von Neumann Architecture
    - a memory with data and instructions, a control unit, and a __cpp_unicode_characters
    - fetch decode execute cycle
    - contains :
        - sequential step-by-step execution
        - the assignment statement
        - variables as named memory locations
        - iteration as the mode of repetition

Language design goals 
    - reliability
    - maintainability
    - efficency

Language translation
- a source program in some source language is translated into an object program in some target language 
    - compiler : translated from high level to low level language 
        - written in its implementation language 
    - interpreter : a program that accepts a source program and runs it immediately
    - interpretive compiler : translated a source program into an intermediate language
        - then the resulting object program is then executed by an interpreter
    - ex 
        - compilers for Fortran : COBOL, C, C++
        - interpretive compiler for Pascal : Prolog and Java
        - interpretors for APL : Scheme, Haskell, Python and LISP

Language Families
    - imperative, procedural, or assignment based 
        - mostly influenced by Von Neumann 
    - functional or applicative
    - logic or declarative

Imperative example : Euclid's Alg (GCD) in C 
#include <stdio.h>
int gcd(int a, int b) {
    while (a > 0 && b > 0) {
        if (a > b) a = a%b;
        else b = b%a;
    }
    return max(a,b);
}

Logic example : Euclid's Alg (GCD) in Prolog
gcd(A,B,G) :- A = 0, G = B.
gcd(A,B,G) :- B = 0, G = A.
gcd(A,B,G) :- A > B, \+(B=0), C is mod(A,B),gcd(C,B,G).
gcd(A,B,G) :- B > A, \+(A=0), C is mod(B,A),gcd(C,A,G).

Functional example : Euclid's Alg (GCD) in Scheme
(define gcd2 ; 'gcd' is built-in to R5RS
    (lambda (a b)
        (cond ((=a 0) b)
            ((=b 0) a)
            ((> a b) (gcd2 (modulo a b) b))
            (else (gcd2 (modulo b a) a)))))


