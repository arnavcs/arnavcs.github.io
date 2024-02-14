<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Writing Solutions>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  We can categorize problems into a couple different types based on what is
  required. There are those problems which tell you a statement that you have
  to prove, and those where you have to make your own statement and then
  justify it.\ 

  In either case, we see that it is required to be able to write good
  solutions. For this reason, it is important that you first solve the
  problem and then proceed to write out the solution.<\footnote>
    But if you are writing a contest where you do not have enough time to
    solve the problem, it is better to write what you have than nothing at
    all.
  </footnote> Here are some tips to remember:

  <\itemize-dot>
    <item>Consider an outline or overview for long/difficult proofs (not
    required for proofs in contests which are always short).

    <item>Consider splitting your proof into smaller lemmas which are
    individually proved.

    <item>Use visual demarcation (such as indents, spacing, and underlining)
    to denote separate parts of the proof and maintain a hierarchy when the
    casework has subcases.

    <item>Explicitly denote the end of a proof with \PQED\Q or a small box.

    <item>Explicitly state your statement/claim at the beginning of the
    solution and optionally box it at the end.
  </itemize-dot>

  For example, consider a question which asks us to find the smallest
  triangular number greater than 100. If you are unfamiliar with triangular
  numbers, they can be defined quite easily.

  <\definition>
    The <math|n><rsup|th> <with|font-series|bold|triangle number>,
    <math|T<rsub|n>>, is the number of dots required to form an equilateral
    triangle out of dots with <math|n> dots on each side. Here are the first
    few triangular numbers which can be explicitly calculated with the
    formula <math|T<rsub|n>=<frac|n*<around*|(|n+1|)>|2>>.

    <\padded-center>
      <tabular|<tformat|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|1|-1|2|-1|cell-halign|c>|<table|<row|<cell|<math|n>>|<cell|<math|0>>|<cell|<math|1>>|<cell|<math|2>>|<cell|<math|3>>|<cell|<math|4>>|<cell|<math|5>>>|<row|<cell|<math|<math|T<rsub|n>>>>|<cell|<math|0>>|<cell|<math|1>>|<cell|<math|3>>|<cell|<math|6>>|<cell|<math|10>>|<cell|<math|15>>>>>>
    </padded-center>
  </definition>

  Here's an example of how you might format the solution to this problem:

  <\solution*>
    The smallest triangle number greater than 100 is 105.

    <with|theorem-padding-above|0fn|<\proof>
      A triangular number is of the form <math|<frac|n*<around*|(|n+1|)>|2>>
      for some positive integer <math|n>, and we can see that this expression
      is strictly increasing with respect to <math|n> for <math|n\<geq\>0>.
      Thus, we see that since <math|<frac|13*<around*|(|13+1|)>|2>=91\<leq\>100\<less\>105=<frac|14*<around*|(|14+1|)>|2>>,
      the <math|14><rsup|th> triangle number,
      <tabular|<tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|1ln>|<cwith|1|1|1|1|cell-rborder|1ln>|<cwith|1|1|1|1|cell-lsep|0.25ex>|<cwith|1|1|1|1|cell-bsep|0.25ex>|<cwith|1|1|1|1|cell-tsep|0.25ex>|<cwith|1|1|1|1|cell-rsep|0.5ex>|<table|<row|<cell|105>>>>>,
      is the smallest triangle number greater than 100.
    </proof>>
  </solution*>

  \;
</body>

<\initial>
  <\collection>
    <associate|hang-length|0em>
    <associate|item-vsep|<macro|0fn>>
    <associate|ornament-extra-color|pastel yellow>
    <associate|ornament-shape|rounded>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnr-1|<tuple|1|1>>
  </collection>
</references>