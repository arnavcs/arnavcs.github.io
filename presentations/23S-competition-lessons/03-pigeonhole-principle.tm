<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Pigeonhole Principle>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  The pigeonhole principle is used in proofs usually to show certain boundary
  cases satisfy a property.

  <section|What is the Pigeonhole Principle?>

  The Pigeonhole Principle, also known as Dirichlet's Box Principle, is
  presented as a statement about with placing pigeons into pigeonholes, but
  applies to much more.

  <\theorem>
    <dueto|Pigeonhole Principle>Suppose there are at least
    <math|n\<times\>k+1> pigeons and <math|k> pigeonholes. If every pigeon is
    in a pigeonhole, then the there exists at least one pigeonhole with
    <math|n+1> pigeons in it.
  </theorem>

  The pigeonhole principle is quite intuitive, and more generalized versions
  of the theorem do exist. If you have to use a generalized version of the
  pigeonhole principle, it is generally not required to cite a theorem or
  give a proof for it in a contest. Here is one of the main generalizations
  of the pigeonhole principle (though others do exist).

  <\theorem>
    <dueto|Generalized Pigeonhole Principle>If
    <math|q<rsub|1>,q<rsub|2>,\<ldots\>,q<rsub|n>\<in\>\<bbb-Z\><rsup|+>>,
    then if <math|<around*|(|<big|sum><rsub|i=1><rsup|n>q<rsub|i>|)>-n+1>
    pigeons are placed into <math|n> holes, then we have that at least one
    <math|1\<leq\>k\<leq\>n> satisfies that the <math|k><rsup|th> pigeonhole
    has at least <math|q<rsub|k>> pigeons in it.
  </theorem>

  This theorem can be used quite trivially to justify statements like the
  following:

  <\problem>
    Prove that if Jean has 10 socks in his drawer, and he takes out 6 of
    them, that he will have at least one matching pair of socks.
  </problem>

  <\solution*>
    By the Pigeonhole Principle, since there are 5 different types of socks,
    and since he has taken out 6, he has taken out at least <math|1+1=2>
    socks of the same type, meaning that he has taken out a matching pair of
    socks.
  </solution*>

  <section|Exercises>

  <\exercise>
    <dueto|1961 SUMO 8.4>Prove that it is possible to place 7 markers in a
    <math|4\<times\>4> grid but impossible to place 6 markers in a
    <math|4\<times\>4> board such that regardless of which two rows and two
    columns are chosen in the grid, there is a marker that is in none of the
    chosen rows or columns.
  </exercise>

  <\exercise>
    There are 5 points chosen in a <math|2\<times\>2> square. Prove that
    there are always two points which are at a distance of at most
    <math|<sqrt|2>> from each other.
  </exercise>

  <\exercise>
    <dueto|1947 HMC>Prove that among any 6 people, you can always find 3
    people who all know each other, or 3 people who all do not know each
    other. Assume that if person <math|A> knows person <math|B>, then person
    <math|B> knows person <math|A>. This problem is a specific case of the
    more general Ramsey's Problem.
  </exercise>

  <\exercise>
    Given a set, <math|S>, of <math|n> integers, prove that there exists a
    nonempty subset, <math|T>, of <math|S> such that the sum of all the
    elements of <math|T > is divisible by <math|n>.
  </exercise>

  SUMO refers to the Soviet Union Mathematical Olympiad and HMO refers to the
  Hungarian Mathematics Competition.
</body>

<\initial>
  <\collection>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>What
      is the Pigeonhole Principle?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>