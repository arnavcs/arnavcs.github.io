---
title: CO 255 - Introduction to Optimization (Advanced Level)
geometry: margin=2cm
---

These are notes of the winter 2024 offering of CO255 with professor Chaitanya Swamy.

# Overview

## Optimization Problems

We can describe an optimization problem as a problem of the form $\min f(x)$ or $\max f(x)$ where $x \in S$, $S \subseteq \mathbb{R}^n$, and $f: \mathbb{R}^n \to \mathbb{R}$.
The following terminology is used when refering to such problems:

- $f$ is the objective function.
- $x$ is the variable.
- $S$ is the feasible region which contains feasible points and the feasible solution (if one exists).

Furthermore, our analysis can be restricted to one of either $\max f(x)$ or $\min f(x)$ since both $\min f(x)$ and $\max -f(x)$ are equivalent optimization problems (they have the same optimal solution and negated optimal values).

## Possible Outcomes of an Optimization Problem

There are 4 possible outcomes of an optimization problem $\min f(x)$ for $x \in S$, $S \subseteq \mathbb{R}^n$, and $f: \mathbb{R}^n \to \mathbb{R}$. They are:

1. The problem is infeasible. This means that the feasible region, $S$, is empty.
1. There is an optimal value. We have that there is some optimal solution (not necessarily unique) $\bar{x} \in S$ such that for all $x \in S$, we have $f(x) \ge f(\bar{x})$.
1. The problem is unbounded. This means that there are feasible solutions of arbitrarily small objective value.
1. The problem is neither unbounded nor unfeasible. This means that $\inf f(x)$ is not attained on the feasible region.

## Linear Programs (LP)

An optimization problem is linear when

1. $f$ is an affine map.
1. $S = \{ x \in \mathbb{R}^n : A x \le b \}$ where $A \in \mathbb{R}^{m \times n}$ and $b \in \mathbb{R}^m$.

Note that here we say that given two vectors $u, v \in \mathbb{R}^n$, we have that $u \le v$ if and only if every component of $u$ is less than the corresponding component of $v$.

In other words, a linear program is an optimization problem of the form $\min c^{\top} x + z_0$ subject to $A x \le b$.
Note that the combination of constraints can also get us equailty constraints.

## Integer Linear Programs (ILP)

Integer linear programs are linear programs with the additional possible constraint that $x_i \in \mathbb{Z}$ for some chosen components $x_i$.

This constraint gives us the power to express casework and conditional aspects of the optimization problem.

## Convex Programs

An optimization problem is convex when

1. We are minimizing the objective function.
1. $S$ is a convex subset of $\mathbb{R}^n$.
1. $f: \mathbb{R}^n \to \mathbb{R}$ is convex on $S$

Recall that we say that $f$ is convex on a convex set $S$ when for all $x, y \in S$ and any $\lambda \in [0,1]$ we have $f(\lambda x + (1 - \lambda) y) \le \lambda f(x) + (1 - \lambda) f(y)$.
When $-f$ is convex, we say that $f$ is concave.

***

## Example Optimization Problems

### Transportation Problem

We are given sets $F, C$ of distribution centers and clients respectively.
Each $i \in F$ can supply at most $u_i \ge 0$ infinitely divisible units, and each $j \in C$ requires $d_j \ge 0$ units.
Transporting from center $i$ to client $j$ costs $\$ c_{i,j}/\mathrm{unit}$.

How can we minimize the cost required to fulfill the demand?

We introduce descision variables $x_{i,j}$ which represent the number of units from $i \in F$ sent to $j \in C$.
Thus, we can represent our optimization problem as the following LP:

$$ \min \sum_{i \in F, j \in C}{c_{i,j} x_{i,j}} $$

subject to

1. $( \forall j \in C ) \left( \sum_{i \in F}{x_{i,j}} = d_j \right)$. All clients have their demand met.
1. $( \forall i \in F ) \left( \sum_{j \in C}{x_{i,j}} \le c_i \right)$. All centers send at most as many units as they have.
1. $x \ge 0$. All centers send a non-negative amount of units.

### 2-Player (Zero-Sum) Game

Players Rose (R) and Colin (C) play a game on the matrix $A = (a_{i,j}) \in \mathbb{R}^{m \times n}$.
R and C choose a row $i$ and column $j$ of $A$ respectively (with no knowledge of the other's choice), then $R$ pays $C$ the amount $a_{i,j}$.

What is the best strategy for Rose and Colin respectively?

#### Colin's LP

Suppose that Colin choses column $j$ with probability $p_j$. We want to maximize the minimum possible expected value of Colin's winnings regardless of Rose's choice.

If Rose choses row $i$ then Colin's expected winnings are $(\mathrm{Row}_i{A}) \cdot p = (A p)_i$. Thus, we would like to find

$$ \max \min_{1 \le i \le m} (A p)_i $$

but since our objective function, $\min_{1 \le i \le m} (A p)_i$ is not affine, this isn't an LP.

Instead, we will introduce another variable $v$ meant to represent $\min_{1 \le i \le m} (A p)_i$ and with this we can express our problem as an LP.
We seek $\max v$ subject to

#### Roses's LP

#### Relationship

### Generalized 2-Player Game


### Fair Division Problem

***

