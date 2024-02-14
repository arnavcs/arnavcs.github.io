<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Points in a Triangle>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  <\definition>
    Given a triangle <math|A B C>, a <with|font-series|bold|cevian> is a line
    segment that connects a vertex to the (possibly extended) opposite side
    of the triangle.
  </definition>

  <section|Circumcircles and Circumcenters>

  <\definition>
    Given a triangle <math|A B C>, we call the unique circle which passes
    through all 3 points the <with|font-series|bold|circumcircle> of <math|A
    B C>. By convention, the <with|font-series|bold|circumcenter> (the center
    of the circumcircle) is denoted <math|O> and has radius equal to the
    <with|font-series|bold|circumradius> of <math|R>. If <math|\<odot\>O> is
    the circumcircle of <math|A B C>, we say that <math|\<vartriangle\>A B C>
    is <with|font-series|bold|inscribed> in the circle.
  </definition>

  <\corollary>
    The circumcenter is the meeting point of the perpendicular bisectors of
    each side of the triangle.
  </corollary>

  <\theorem>
    If <math|O> is the circumcenter of <math|\<vartriangle\>A B C>, then
    <math|\<leangle\>B O C=2*a>, <math|\<leangle\>O B C=\<leangle\>O C
    B=90\<degree\>-a>.
  </theorem>

  <section|Incircles and Incenters>

  <\definition>
    Given a triangle <math|A B C>, we call the unique circle which is tangent
    to all of the sides of the triangle from the inside the
    <with|font-series|bold|incircle>. The center of the incircle is the
    <with|font-series|bold|incenter> and is denoted <math|I> and the
    <with|font-series|bold|inradius> is denoted <math|r>. If <math|\<odot\>I>
    is the incircle of <math|A B C>, we say that it is
    <with|font-series|bold|inscribed> in <math|\<vartriangle\>A B C>.
  </definition>

  <\corollary>
    The incenter is the meeting point of the angle bisectors of each vertex
    of a triangle.
  </corollary>

  <\theorem>
    If <math|I> is the incenter of <math|\<vartriangle\>A B C>, then
    <math|\<leangle\>B I C=90\<degree\>+<frac|a|2>>, <math|\<leangle\>I B
    C=<frac|b|2>>. and <math|\<leangle\>I C B=<frac|c|2>>.
  </theorem>

  <section|Excenters and Excircles>

  <\definition>
    Given a triangle <math|A B C>, we call a circle which is outside the
    triangle, but tangent to all of the sides of the triangle (or their
    extensions) an <with|font-series|bold|excircle>. The 3 excircles of a
    triangle correspond to the vertex which is opposite them in the triangle.
    The center of the <math|A>-excircle in triangle <math|A B C> is the
    <with|font-series|bold|<math|A>-excenter> and is denoted <math|I<rsub|A>>
    with <with|font-series|bold|exradius> <math|r<rsub|A>>.
  </definition>

  <\corollary>
    The <math|A>-excenter is the meeting point of the internal angle bisector
    at <math|A> and the external angle bisectors at <math|B> and <math|C>.
  </corollary>

  <\theorem>
    If <math|I<rsub|A>> is the <math|A>-excenter of <math|\<vartriangle\>A B
    C>, then <math|\<leangle\>B I<rsub|A> C=90\<degree\>-<frac|a|2>>,
    <math|\<leangle\>A I<rsub|A> B=<frac|c|2>>. and <math|\<leangle\>A
    I<rsub|A> C=<frac|b|2>>.
  </theorem>

  <section|Orthocenters>

  <\definition>
    Given a triangle <math|A B C>, an <with|font-series|bold|altitude>
    dropped from any vertex is the cevian from the vertex which is
    perpendicular to the opposite side of the triangle. The
    <with|font-series|bold|orthocenter> is the meeting point of the the 3
    altitudes dropped from each vertex to the opposite side and is generally
    denoted <math|H>.
  </definition>

  <\theorem>
    If <math|H> is the orthocenter of <math|\<vartriangle\>A B C>, then
    <math|\<leangle\>B H C=180\<degree\>-a>, <math|\<leangle\>H B
    C=90\<degree\>-c>. and <math|\<leangle\>H C B=90\<degree\>-b>.
  </theorem>

  <section|Centroids>

  <\definition>
    Given a triangle <math|A B C>, the cevian <math|A D> is called a
    <with|font-series|bold|median> if <math|B D=D C>. The 3 medians of a
    triangle are concurrent and called the <with|font-series|bold|centroid>,
    usually denoted <math|G>.
  </definition>

  <\theorem>
    If <math|A D>, <math|B E>, and <math|C F> are medians of triangle <math|A
    B C> which intersect at centroid <math|G>, then we have that <math|A
    G=2\<cdot\>G D>.
  </theorem>

  <section|Exercises>

  All of these exercise problems are well known results.

  <\exercise>
    Show that the circumcenter of a right triangle is the midpoint of its
    hypotenuse.
  </exercise>

  <\exercise>
    Show that given a triangle <math|A B C>, the intersections of the
    internal and external bisectors of <math|\<leangle\>B A C> with the
    perpendicular bisector of <math|B C> both lie on the circumcircle of
    <math|A B C>.
  </exercise>

  <\exercise>
    Let <math|A B C> be a triangle with circumcenter <math|O> and orthocenter
    <math|H>. Let <math|D> be the point directly opposite <math|A> on the
    circumcircle, let <math|M> be the midpoint of <math|B C>, and let
    <math|E> be the reflection of <math|H> on <math|B C>. Show that

    <\enumerate-numeric>
      <item><math|B H C D> is a parallelogram

      <item><math|M> is the midpoint of <math|H D>

      <item><math|E> lies on the circumcircle of <math|A B C>

      <item><math|\<leangle\>B A H=\<leangle\>C A O>
    </enumerate-numeric>
  </exercise>
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
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|2>>
    <associate|auto-6|<tuple|6|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Circumcircles
      and Circumcenters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Incircles
      and Incenters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Orthocenters>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Centroids>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Scaling,
      Transformations, and Translations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>