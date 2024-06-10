---
title: Spring ’24 Wizard Reading Club Sessions
path: '[[Arnav Kumar]](../../index.html) / '
---

# Introduction

The Wizard Reading Club spawned from a curiosity of what the wizard book, *Structure and Interpretation of Computer Programs* by Harold Abelson, Gerald Jay Sussman, and Julie Sussman, has to offer.

The text is avaliable completely for free in [(pdf)](https://web.mit.edu/6.001/6.037/sicp.pdf) and [(html)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html) file formats.

In addition, video lectures and accompanying course content are avaliable [(here)](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/), but this is not the main focus of this reading club.

Each member of the club is assigned a different set of exercises to complete, and we share notable exercises during meetings.

# Schedule

+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Meeting Time    | Content Discussed                                                                                                                                   |
+=================+=====================================================================================================================================================+
| Fri, 7^th^ Jun  | [(Introduction to Chapter 1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-9.html) |
|                 | and [(Section 1.1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html)          |
+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Mon, 10^th^ Jun | [(Section 1.2)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-11.html)              |
+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Fri, 14^th^ Jun | [(Section 1.3)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-12.html)              |
+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+

# Meeting 1

## Exercise 1.1

```
10
12
8
3
6
19
#f
4
16
6
16
```

## Exercise 1.2

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
```

## Exercise 1.3

```scheme
(define (min a b) (if (a < b) a b))

(define (sum-sq a b) (+ (a * a) (b * b)))

(define (f a b c)
  (define m (min (min a b) c))
  (cond ((= a m) (sum-sq b c))
        ((= b m) (sum-sq a c))
        (else    (sum-sq a b))))
```

## Exercise 1.4

The operation is selected based on if `(> b 0)`. In specific, if `b` is greater than `0`, then the result is `(+ a b)` and otherwise it is `(- a b)`.

## Exercise 1.5

With an interpreter using applicative order, the program will hand and never terminate.
It will attempt to evaluate `(p)` first (as it is an argument of `test`), which is not computable.

With normal order, though, the program would terminate, yielding the value `0`.
In specific, `(p)` will never be attempted to be evaluated because of the normal-order.

## Exercise 1.6

`if` is a special form, whereas `new-if` is simply a proceedure, so that all arguments are evaluated first.

This means that `sqrt-iter` will never terminate because it will recursively call itself forever.

## Exercise 1.7

When small, the ratio of estimate to actual value is high.
When large, floating point numbers are more coarse and there aren't numbers within 0.001 of the desired value.

```scheme
(define (sqrt x)
  (define (new-guess g x)
    (/ (+ g (/ x g)) 2))
  (define (sqrt-iter g x)
    (define g* (new-guess g x))
    (if (< (abs (/ (- g* g) g*)) 0.001)
        g*
        (sqrt-iter g* x)))
  (sqrt-iter 1 x))
```

## Exercise 1.8

```scheme
(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))
```

# Meeting 2

## Exercise 1.9

With the first definition, we get a recursive process as seen below.
```scheme
   (+ 4 5)
=> (inc (+ 3 5))
=> (inc (inc (+ 2 5)))
=> (inc (inc (inc (+ 1 5))))
=> (inc (inc (inc (inc (+ 0 5)))))
=> (inc (inc (inc (inc 5))))
=> (inc (inc (inc 6)))
=> (inc (inc 7))
=> (inc 8)
=> 9
```
And with the second, we get an iterative process as show below.
```scheme
   (+ 4 5)
=> (+ 3 6)
=> (+ 2 7)
=> (+ 1 8)
=> (+ 0 9)
=> 9
```

## Exercise 1.13

Let $F_n$ be the $n$^th^ Fibonacci number. Binet's formula gives us $F_n = \frac{\phi^n - \psi^n}{\sqrt{5}} = \frac{\phi^n}{\sqrt{5}} - \frac{\psi^n}{\sqrt{5}}$.

Since $\psi \in (0,1)$, for all $n \in \mathbb{N}$ we have $|\psi^n| \le |\psi|$ so $\left| F_n - \frac{\phi^n}{\sqrt{5}} \right| = \left| \frac{\psi^n}{\sqrt{5}} \right| \le \left| \frac{\psi}{\sqrt{5}} \right| < 0.5$.

Hence $F_n$ is the closest integer to $\frac{\phi^n}{\sqrt{5}}$ as desired.

## Exercise 1.17

```scheme
(define (fast-* a b)
  ; fast-*-iter calculates a * b + acc
  (define (fast-*-iter acc a b)
    (cond
      ((zero? b) acc)
      ((even? b) (fast-*-iter acc
                              (double a)
                              (halve b)))
      (else      (fast-*-iter (+ acc a)
                              a
                              (- b 1)))))
  (fast-*-iter 0 a b))
```

## Exercise 1.21

The smallest divisors of 199, 1999, and 19999 are 199, 1999, and 7 respectively.

## Exercise 1.25

This would not be ideal for our fast prime tester.
By taking the remainder at the end, we have to calculate the entire exponentiation result, meaning that we work with larger numbers so each multiplication is harder.
On the other hand, by taking the remainder after every step, we maintain small values.


