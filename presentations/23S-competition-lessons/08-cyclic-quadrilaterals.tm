<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Cyclic Quadrilaterals and More
  Triangles>|<doc-author|<author-data|<author-name|Arnav Kumar>>>>

  <section|Cyclic Quadrilaterals>

  <\definition>
    We call a quadrilateral which can be incribed in a circle a
    <with|font-series|bold|cyclic quadrilateral> (or a
    <with|font-series|bold|concyclic quadrilateral>) and we say that the
    circle circumscribes the quadrilateral.
  </definition>

  From the previous lesson about points in a triangle, we learnt about the
  properties of triangles inscribed in a circle, and because we know that
  there are <math|<choose|4|3>=4> distinct triangles in a cyclic
  quadrilateral, we can make some statements with our knowledge of angles
  while dealing with circumcircles.

  <\theorem>
    Any 4 points <math|A>, <math|B>, <math|C>, and <math|D> are concyclic iff
    <math|\<measuredangle\>A B C=\<measuredangle\>A D C>.
  </theorem>

  <section|Related Theorems>

  <\theorem>
    <dueto|Power of a Point>If <math|A B C D> is a convex quadrilateral with
    <math|A B> and <math|C D> intersecting at <math|P> and <math|A C> and
    <math|B D> intersecting at <math|Q>, then <math|A B C D> is cyclic iff
    either:

    <\enumerate-numeric>
      <item><math|A Q\<cdot\>Q C=B Q\<cdot\>Q D> (or equivalently <math|Q A
      D\<sim\>Q B C>)

      <item><math|P A\<cdot\>P B=P C\<cdot\>P D> (or equivalently <math|P A
      D\<sim\>P C B>)
    </enumerate-numeric>
  </theorem>

  <\theorem>
    <dueto|Ptolemy's Theorem>Quadrilateral <math|A B C D> is cyclic iff

    <\equation*>
      A B\<cdot\>C D+A D\<cdot\>B C=A C\<cdot\>B D
    </equation*>
  </theorem>

  <\theorem>
    <dueto|Brahmagupta's Formula>If <math|A B C D> is a cyclic quadrilateral
    with sides of length <math|a>, <math|b>, <math|c>, and <math|d>, then let
    the semiperimeter be <math|s\<assign\><tfrac|1|2><around*|(|a+b+c+d|)>>.
    We have that:

    <\equation*>
      <around*|[|A B C D|]>=<sqrt|<around*|(|s-a|)>*<around*|(|s-b|)>*<around*|(|s-c|)>*<around*|(|s-d|)>>
    </equation*>
  </theorem>

  <\corollary>
    <dueto|Heron's Formula>For a triangle <math|A B C>, if <math|s> is the
    semiperimeter, <math|<frac|1|2><around*|(|a+b+c|)>>, we have:

    <\equation*>
      <around*|[|A B C|]>=<sqrt|s*<around*|(|s-a|)>*<around*|(|s-b|)>*<around*|(|s-c|)>>
    </equation*>
  </corollary>

  <section|Exercises>

  <\exercise>
    Let <math|A B C> be a triangle with heights <math|A D>, <math|B E>, and
    <math|C F>. Show that:

    <\enumerate-numeric>
      <item>The incenter of <math|\<vartriangle\>D E F> is the orthocenter of
      <math|\<vartriangle\>A B C>.

      <item><math|\<leangle\>D E F=180<rsup|\<circ\>>-2*\<leangle\>A B C>
    </enumerate-numeric>
  </exercise>

  <\exercise>
    This is a well known fact. Prove that if <math|l> is a line tangent to
    the circumcircle of <math|A B C> at <math|A>, and <math|D> lies on
    <math|l> such that <math|\<leangle\>D A C\<gtr\>\<leangle\>D A B>, then
    <math|\<leangle\>D A B=\<leangle\>A C B>.
  </exercise>

  <\exercise>
    <dueto|2022 KJMO Q1>The inscribed circle of an acute triangle <math|A B
    C> meets the segments <math|A B> and <math|B C> at <math|D> and <math|E>
    respectively. Let <math|I> be the incenter of the triangle <math|A B C>.
    Prove that the intersection of the line <math|A I> and <math|D E> is on
    the circle whose diameter is <math|A C>.
  </exercise>

  <\exercise>
    Let <math|A B C> be an equilateral triangle, and let <math|P> lie on the
    minor arc <math|B C> of its circumcircle. Show <math|P A=P B+P C>.
  </exercise>

  <\exercise>
    Let <math|A B C D E F G> be a regular heptagon. Show that <math|<frac|1|A
    B>=<frac|1|A C>+<frac|1|A E>>.
  </exercise>

  KJMO refers to the Korean Junior Math Olympiad.
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
    <associate|auto-3|<tuple|3|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Cyclic
      Quadrilaterals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Related
      Theorems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>