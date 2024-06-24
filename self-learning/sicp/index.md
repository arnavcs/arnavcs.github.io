---
title: Spring ’24 Wizard Reading Club Sessions
path: '[[Arnav Kumar]](../../index.html) / '
---

# Introduction

The Wizard Reading Club spawned from a curiosity of what the wizard book, *Structure and Interpretation of Computer Programs* by Harold Abelson, Gerald Jay Sussman, and Julie Sussman, has to offer.

The text is avaliable completely for free in [(pdf)](https://web.mit.edu/6.001/6.037/sicp.pdf) and [(html)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html) file formats.

In addition, video lectures and accompanying course content are avaliable [(here)](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/), but this is not the main focus of this reading club.

Each member of the club is welcome to complete any set of exercises that interest them, and we will share notable exercises during meetings.

# Schedule

+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| No. | Meeting Time    | Content Discussed                                                                                                                                    |
+=====+=================+======================================================================================================================================================+
| 1   | Fri, 7^th^ Jun  | [(Introduction to Chapter 1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-9.html)  |
|     |                 | and [(Section 1.1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html)           |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 2   | Mon, 10^th^ Jun | [(Section 1.2)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-11.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 3   | Fri, 14^th^ Jun | [(Section 1.3)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-12.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4   | Mon, 17^th^ Jun | [(Introduction to Chapter 2)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-13.html) |
|     |                 | and [(Section 2.1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-14.html)           |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 5   | Fri, 28^th^ Jun | [(Section 2.2)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-15.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 6   | Fri, 5^th^ Jul  | [(Section 2.3)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-16.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 7   | Fri, 12^th^ Jul | [(Section 2.4)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-17.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 8   | Fri, 19^th^ Jul | [(Section 2.5)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-18.html)               |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| 9   | Fri, 26^th^ Jul | [(Introduction to Chapter 3)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-19.html) |
|     |                 | and [(Section 3.1)](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-20.html)           |
+-----+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------+

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

# Meeting 3

## Exercise 1.34

The interpreter will give an error and be unable to interpret the expression `(f f)`. This is because we try to apply `2` as if it were a function, but it is not.

```scheme
   (f f)
=> (f 2)
=> (2 2)
```

## Exercise 1.42

```scheme
(define (compose f g)
  (lambda (x) (f (g x))))
```

## Exercise 1.43

Written as a linear iterative process:

```scheme
(define (repeated f n)
  (lambda (x)
    (define (iter n a)
      (if (zero? n)
          a
          (iter (- n 1) (f a))))
    (iter n x)))
```

## Exercise 1.44

```scheme
(define (smooth f)
  (define dx 0.0001)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth n f)
  ((repeated smooth n) f))
```

# Meeting 4

## Exercise 2.4

We have that `(car (cons x y))` yields `x` as desired.

```scheme
   (car (cons x y))
=> (car (lambda (m) (m x y)))
=> ((lambda (m) (m x y)) (lambda (p q) p))
=> ((lambda (p q) p) x y)
=> x
```

And a valid definition of `cdr` is given below.

```scheme
(define (cdr z)
  (z (lambda (p q) q)))
```

## Exercise 2.5

```scheme
(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car z)
  (define (iter n z)
    (if (zero? (modulo z 2))
        (iter (+ n 1) (/ z 2))
        0))
  (iter 0 z))

(define (cdr z)
  (define (iter n z)
    (if (zero? (modulo z 3))
        (iter (+ n 1) (/ z 3))
        0))
  (iter 0 z))
```

## Exercise 2.6

```scheme
(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))
```

# Meeting 5

## Exercise 2.17

```scheme
(define (last-pair as)
  (if (null? (cdr as))
      as
      (last-pair (cdr as))))
```

## Exercise 2.18

```scheme
(define (reverse as)
  (define (rev-iter in out)
    (if (null? in)
        out
        (rev-iter (cdr in)
                  (cons (car in)
                        out))))
  (rev-iter as '()))
```

## Exercise 2.20

```scheme
(define (same-parity . as)
  (define (filter-parity as p)
    (cond ((null? as)                as)
          ((= (modulo (car as) 2) p) (cons (car as)
                                           (filter-parity (cdr as) p)))
          (else                      (filter-parity (cdr as) p))))
  (filter-parity as
                 (if (null? as)
                     -1
                     (modulo (car as) 2))))
```

## Exercise 2.23

```scheme
(define (for-each f as)
  (if (null? as)
      #t
      (begin (f (car as))
             (for-each f (cdr as)))))
```

## Exercise 2.24

The interpreter will print `(1 (2 (3 4)))`.
Here is the box-and-pointer structure:
```
┌───┬───┐   ┌───┬───┐
│   │   │ → │   │ / │
└───┴───┘   └───┴───┘
  ↓           ↓
┌───┐       ┌───┬───┐   ┌───┬───┐
│ 1 │       │   │   │ → │   │ / │
└───┘       └───┴───┘   └───┴───┘
              ↓           ↓
            ┌───┐       ┌───┬───┐   ┌───┬───┐
            │ 2 │       │   │   │ → │   │ / │
            └───┘       └───┴───┘   └───┴───┘
                          ↓           ↓
                        ┌───┐       ┌───┐
                        │ 3 │       │ 4 │
                        └───┘       └───┘
```

Here is the tree diagram:
```
  •
 / \
1   •
   / \
  2   •
     / \
    3   4
```

## Exercise 2.27

```scheme
(define (deep-reverse t)
  (cond
    ((null? t) t)
    ((pair? t) (reverse (map deep-reverse t)))
    (else      t)))
```

## Exercise 2.28

```scheme
(define (fringe t)
  (cond
    ((null? t) t)
    ((pair? t) (append (fringe (car t))
                       (fringe (cdr t))))
    (else      (list t))))
```

## Exercise 2.31

```scheme
(define (tree-map f t)
  (cond
    ((null? t) t)
    ((list? t) (map (lambda (t) (tree-map f t)) t))
    (else      (f t))))
```

## Exercise 2.32

Because every subset either contains an element or doesn't, we simply split on those two cases, and append the results.

```scheme
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest                               ; subset doesn't contain (car s)
                (map (lambda (x) (cons (car s) x)) ; subset contains (car s)
                     rest)))))
```

## Exercise 2.33

```scheme
(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) '() seq)

(define (append seq1 seq2)
  (accumulate cons seq2 (reverse seq1)))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
```

## Exercise 2.41

```scheme
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
```
