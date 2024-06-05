---
title: Spring ’24 Wizard Reading Club Sessions
path: '[[Arnav Kumar]](../../index.html) / '
---

# Introduction

The Wizard Reading Club spawned from a curiosity of what the wizard book, *Structure and Interpretation of Computer Programs* by Harold Abelson, Gerald Jay Sussman, and Julie Sussman has to offer.

The text is avaliable completely for free in [(pdf)](https://web.mit.edu/6.001/6.037/sicp.pdf) and [(html)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html) file formats.

In addition, video lectures and accompanying course content are avaliable [(here)](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/), but this is not the main focus of this reading club.

# Schedule

+----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| Meeting Time   | Content Discussed                                                                                                                                     |
+================+=======================================================================================================================================================+
| Fri, 7^th^ Jun | [(Introduction to Chapter 1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-9.html)   |
|                | and [(Section 1.1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html)            |
+----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+

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
