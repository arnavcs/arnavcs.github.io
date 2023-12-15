---
title: Example Course Notes
---

This is some example stuff for if I decide to take notes this way next term.

```{.graphviz}
digraph overview {
  node [shape=plaintext colorscheme=pastel24];
  edge [fontsize="10"]
  ref [label=<
  <TABLE>
    <TR><TD BGCOLOR="1">definition</TD></TR>
    <TR><TD BGCOLOR="2">property</TD></TR>
    <TR><TD BGCOLOR="3"></TD></TR>
    <TR><TD BGCOLOR="4">result</TD></TR>
  </TABLE>
  >]
  concept1 [label=<
  <TABLE PORT="f">
    <TR><TD BGCOLOR="1">Object</TD></TR>
    <TR><TD BGCOLOR="2">dfa</TD></TR>
  </TABLE>
  >];
  concept2 [label=<
  <TABLE PORT="f">
    <TR><TD BGCOLOR="1" PORT="g">This</TD></TR>
    <TR><TD BGCOLOR="2" PORT="h">is</TD></TR>
  </TABLE>
  >];
  concept1:f -> concept2:h [label="Lemma 1"];
}
```

# Lecture 14

Propositional logic is weak. It doesn't give us any insight into the inner workings of our statements.
We need a more expressive logic that can encapsulate the parts of a statement.

## Intro to First Order Logic (FOL)

We can break statements into two components: objects and properties.

FOL is actually a large family of languages rather than a single language like propositional logic was.
Some things that are common between all of these families, though, are

- propositional connectives ($\neg$, $\land$, $\lor$, $\rightarrow$)
- quantifiers ($\forall$, $\exists$)
- equality ($=$)

Additionally, there are 3 types of language specific symbols:

- constant symbols
- relations symbols
- function symbols

Here is a plot

And here is some code:

```{.c .numberLines startFrom="100"}
int main () {
  int h, w;
  for (;;) printf("slkdf");
  return 0;
}
```

