---
title: Math 245 - Linear Algebra 2 (Advanced Level)
---

I took Math 245 with Stephen New during the fall 2023 term at the University of Waterloo.

# Overview

```{.graphviz}
digraph overview {
  label="Math 245 Knowledge Tree"
  node [shape=box, style="rounded,filled", width=2, colorscheme=pastel24]

  subgraph chapter1 {
    as [fillcolor=1, label="Affine Space"]

    pt [fillcolor=1, label="Point"]
    as -> pt

    qs [fillcolor=1, label="Quotient Space"]
    as -> qs

    rss [fillcolor=2, label="Affine Space\nRelationship of Subspaces"]
    as -> rss

    avs [fillcolor=1, label="Affine Space\nAssociated Vector Space"]
    rss -> avs

    asd [fillcolor=1, label="Affine Space\n(Co)Dimension"]
    avs -> asd

    plphp [fillcolor=1, label="Point, Line, Plane,\nand Hyperplane"]
    asd -> plphp

    ias [fillcolor=2, label="Intersection of Affine Spaces"]
    avs -> ias

    asp [fillcolor=1, label="Affine Span"]
    ias -> asp

    fasp [fillcolor=2, label="Affine Span Formula"]
    asp -> fasp

    ac [fillcolor=1, label="Affine Combination"]
    fasp -> ac
    asp -> ac [arrowhead="onormal"]

    ai [fillcolor=1, label="Affinely (In)Dependent"]
    as -> ai
    asp -> ai [arrowhead="onormal"]

  }
}
```

sdlfk


