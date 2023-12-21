---
title: Probability and Random Processes
---

This is based on *Probability and Random Processes* by Geoffrey Grimmet and
David Stirzaker.

# Events and Their Probabilities

```{.graphviz}
digraph chapter1 {
  node [shape=box, style="rounded,filled", width=2, colorscheme=pastel24]

  experiment [fillcolor=1, label="Experiment / Trial"]

  outcome [fillcolor=1, label="Elementary Event / Outcome"]
  experiment -> outcome

  sample_space [fillcolor=1, label="Sample Space"]
  outcome -> sample_space

  sigma_field [fillcolor=1, label="σ-Field"]
  sample_space -> sigma_field

  event [fillcolor=1, label="Event"]
  sigma_field -> event

  disjoint [fillcolor=1, label="Disjoint Events"]
  event -> disjoint

  certain_impossible [fillcolor=1, label="Certain and Impossible Events"]
  event -> certain_impossible

  demorgans_laws [fillcolor=2, label="DeMorgan's Laws"]
  sample_space -> demorgans_laws
  event -> demorgans_laws [arrowhead="onormal"]

  measure [fillcolor=1, label="Measure"]

  probability_measure [fillcolor=1, label="Probability Measure"]
  sigma_field -> probability_measure
  measure -> probability_measure

  probability_space [fillcolor=1, label="Probability Space"]
  sample_space -> probability_space
  sigma_field -> probability_space
  probability_measure -> probability_space

  probability_monotonicity [fillcolor=2, label="Monotonicity of Probability"]
  probability_space -> probability_monotonicity

  monotonic_events_limit_probability [fillcolor=2, label="Probability of the Limit\nof Monotonic Events"]
  probability_monotonicity -> monotonic_events_limit_probability

  null_almost_surely [fillcolor=1, label="Null or Almost Surely Events"]
  event -> null_almost_surely
  probability_space -> null_almost_surely

  principle_inclusion_exclusion [fillcolor=2, label="Principle of Inclusion-Exclusion"]
  probability_space -> principle_inclusion_exclusion

  conditional_probability [fillcolor=1, label="Conditional Probability"]
  probability_space -> conditional_probability

  partition [fillcolor=1, label="Partition"]
  sample_space -> partition
  event -> partition [arrowhead="onormal"]

  probability_through_partition [fillcolor=2, label="Probability through Partitioning"]
  partition -> probability_through_partition
  conditional_probability -> probability_through_partition

  bayes_theorem [fillcolor=2, label="Bayes' Theorem"]
  conditional_probability -> bayes_theorem

  independence [fillcolor=1, label="Independence"]
  probability_space -> independence
  conditional_probability -> independence [arrowhead="onormal"]

  pairwise_independence [fillcolor=1, label="Pairwise Independence"]
  independence -> pairwise_independence

  conditional_independence [fillcolor=1, label="Conditional Independence"]
  independence -> conditional_independence
  conditional_probability -> conditional_independence

  intersection_sigma_field [fillcolor=2, label="Intersection of\nσ-Fields is σ-Field"]
  sigma_field -> intersection_sigma_field

  complete [fillcolor=1, label="Complete Probability Space"]
  probability_space -> complete
  null_almost_surely -> complete

  completion [fillcolor=1, label="Completion"]
  complete -> completion

  product_space [fillcolor=1, label="Product Space"]
  probability_space -> product_space

  booles_inequalities [fillcolor=2, label="Boole's Inequalities"]
  probability_space -> booles_inequalities

  warings_theorem [fillcolor=2, label="Waring's Theorem"]
  probability_space -> warings_theorem

  bonferronis_inequalities [fillcolor=2, label="Bonferroni's Inequalities"]
  booles_inequalities -> bonferronis_inequalities

  kounias_inequality [fillcolor=2, label="Kounias' Inequality"]
  booles_inequalities -> kounias_inequality
}
```

# Random Variables and their Distributions

```{.graphviz}
digraph chapter2 {
  node [shape=box, style="rounded,filled", width=2, colorscheme=pastel24]

  random_variable [fillcolor=1, label="Random Variable"]

  F_measurable [fillcolor=1, label="ℱ-measurable"]
  random_variable -> F_measurable

  distribution_function [fillcolor=1, label="Distribution Function"]
  random_variable -> distribution_function

  distribution_function_increasing [fillcolor=2, label="Distribution Function\nIncreasing"]
  distribution_function -> distribution_function_increasing

  distribution_function_limits [fillcolor=2, label="Distribution Function\nLimits at ±∞"]
  distribution_function -> distribution_function_limits

  distribution_function_right_continuous [fillcolor=2, label="Distribution Function\nis Right-Continuous"]
  distribution_function -> distribution_function_right_continuous

  constant_variable [fillcolor=1, label="Constant Variable"]
  random_variable -> constant_variable

  bernoulli_variable [fillcolor=1, label="Bernoulli Variable"]
  random_variable -> bernoulli_variable

  indicator_function [fillcolor=1, label="Indicator Function"]
  bernoulli_variable -> indicator_function

  tails [fillcolor=1, label="Distribution Function\nRight and Left Tails"]
  distribution_function -> tails

  probability_of_tails [fillcolor=2, label="Probability of Tails"]
  tails -> probability_of_tails

  probability_of_ranges [fillcolor=2, label="Probability of\n(x < X ≤ y), (X = x)"]
  distribution_function -> probability_of_ranges
}
```

