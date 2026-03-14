---
title:
- Dijkstra's non-deterministic Guarded Command Language from afar
author:
- Arnav Kumar
theme:
- Copenhagen
date:
- March 17th, 2026
---

# What is a non-deterministic language?

- A language with support for various alternatives for program flow in a way that is not specified or chosen by the programmer
- Some examples are Promela and Problog
- Other languages can exhibit features of non-determinism from interacting with the world (concurrency, communication, IO, etc.)

# Intro to the Guarded Command Language (GCL)

- GCL is non-deterministic
- This talk will cover the syntax and mechanistic semantics
- Dijkstra of
  - *Dijkstra's Algorithm*
  - *Go To statement considered harmful*
- Dijkstra's Guarded Command Calculus is a calculus for deriving correct programs in GCL

# Guarded Command Sets

```
⟨guard⟩ ::= ⟨boolean expression⟩
⟨guarded list⟩ ::= ⟨statement⟩ {; ⟨statement⟩}
⟨guarded command⟩ ::= ⟨guard⟩ → ⟨guarded list⟩
⟨guarded command set⟩ ::= ⟨guarded command⟩ {□ ⟨guarded command⟩}
```

# Alternative Statements

```
⟨alternative construct⟩ ::= if ⟨guarded command set⟩ fi
```

- Execute an arbitrary guarded list with a true guard
- If none of the guards are true, abort

# Repetitive Statements

```
⟨repetitive construct⟩ ::= do ⟨guarded command set⟩ od
```
- Keep executing arbitrary guarded lists with true guards
- When there are no true guards, skip

# Examples: Sorting 4 numbers

```
// want a, b, c, d a permutation of A, B, C, D
// such that a ≤ b ≤ c ≤ d

a, b, c, d := A, B, C, D;

do (a < b) → a, b := b, a
 □ (b < c) → b, c := c, b
 □ (c < d) → c, d := d, c
od
```

- Note that we cannot deterministically guarantee the program flow, but we are guaranteed a correct result

# Examples: Argmax of a function

```
// suppose f : {1 .. k} → Int
// want m such that f(m) ≥ f(i) for all i ∈ {1 .. k}

m := 1;
i := 1;

do i ≤ k → if f(i) ≤ f(m) → i := i + 1
            □ f(i) ≥ f(m) → k := i; i := i + 1
           fi
od
```

- If there are multiple valid solutions, we can attain any of them

# Example: GCD

```
// want g such that g = GCD(X, Y) for X, Y ∈ Nat

x, y := X, Y

do (x > y) → x := x - y
 □ (y > x) → y := y - x
od

g := x
```

# Applications

- Guarded commands are used in Promela, the modelling language for the SPIN concurrency checker
- The calculus is relevant to structured program composition
- Hard to think of a use for non-determinism besides modelling and logic: it's neither random nor heuristic
- Every implementation of non-determinism is either random or heuristic

# Learn More

    Dijkstra, Edsger W. ["EWD472: Guarded commands, non-determinacy and formal. derivation of programs"](http://www.cs.utexas.edu/users/EWD/ewd04xx/EWD472.PDF) (PDF). Retrieved March 14, 2026.

Also take a look at the [Promela wikipedia](https://en.wikipedia.org/wiki/Promela) and the [SPIN model checker webpage](https://spinroot.com/spin/whatispin.html)
