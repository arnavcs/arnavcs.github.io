<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|The Catalan Numbers>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  This handout provides a somewhat more formal (but for brevity, still
  incomplete) take on the lecture content.

  <\proposition>
    We have that given two (finite) sets <math|A> and <math|B>, the (size)
    cardinality of <math|A> and <math|B> is equal if there is a bijection
    between the sets. In other words, if there is a map
    <math|f\<of\>A\<rightarrow\>B> such that for any <math|b\<in\>B> there is
    a unique <math|a\<in\>A> such that <math|f<around*|(|a|)>=b>, then
    <math|<around*|\||A|\|>=<around*|\||B|\|>>.
  </proposition>

  <\proposition>
    We have that <math|<choose|n|k>=<frac|n!|k!*<around*|(|n-k|)>!>> is the
    number of ways to choose <math|k> objects from a collection of <math|n>
    where <math|0!=0> and <math|n!=1\<times\>2\<times\>\<cdots\>\<times\>n>
    for <math|n\<gtr\>0,n\<in\>\<bbb-Z\>><math|>.
  </proposition>

  <\problem>
    We are playing a game on the Cartesian plane. Every move, if we were at
    the position <math|<around*|(|x,y|)>> we may move to either
    <math|<around*|(|x+1,y|)>> or <math|<around*|(|x,y+1|)>>. For
    <math|n\<in\>\<bbb-N\>> arbitrary, how many distinct paths are there from
    <math|<around*|(|0,0|)>> to <math|<around*|(|n,n|)>> given that we never
    move above the line <math|y=x>?
  </problem>

  I choose to share the following solution because it is perhaps the easiest
  elementary solution which still provides a closed form solution, rather
  than a recurrence relation.

  <\solution*>
    Lets represent a path as a finite sequence of moves. A move is one of
    <math|U> for up or <math|R> for right. Additionally, if <math|S> is a
    path, we define <math|S<around*|(|x,y|)>> to be the point we end up at as
    a result of following the path <math|S> starting at
    <math|<around*|(|x,y|)>>. By convention, if <math|k=0>, we'll take
    <math|S<around*|(|x,y|)>=<around*|(|x,y|)>>. Let
    <math|#<rsub|U><around*|(|S|)>> and <math|#<rsub|R><around*|(|S|)>> be
    the number of <math|U>s and <math|R>s in our path respectively.

    Let <math|T> be the set of all paths <math|S> such that
    <math|S<around*|(|0,0|)>=<around*|(|n,n|)>>. Additionally, define
    <math|A\<subseteq\>T> to be all of those paths which have a point on the
    path above <math|y=x>.

    Note that <math|>the value we are searching for is
    <math|<around*|\||T\\A|\|>=<around*|\||T|\|>-<around*|\||A|\|>> since
    <math|T> and <math|A\<subseteq\>T> are finite. This is because we want
    the number of paths from <math|<around*|(|0,0|)>> to
    <math|<around*|(|n,n|)>> which are never above <math|y=x>.

    Further, we know that for any <math|S\<in\>T>, we have
    <math|#<rsub|R><around*|(|S|)>=#<rsub|U><around*|(|S|)>=n>. Thus we see
    that <math|<around*|\||T|\|>=<choose|2*n|n>> which is the number of ways
    to choose which of the <math|2*n> moves is <math|U> (the rest have to be
    <math|R>s).

    For any <math|S\<in\>A>, let's suppose that move <math|l> was the first
    move that brought us above <math|y=x>. Since it is the first, we know
    that after move <math|l>, we are on the line <math|y=x+1>. We split up
    <math|S> into <math|S<rsub|0>> and <math|S<rsub|1>> which are the parts
    of <math|S> before reaching <math|y=x+1> for the first time, and after
    reaching <math|y=x+1> for the first time. We see that
    <math|#<rsub|R><around*|(|S<rsub|0>|)>=1+#<rsub|U><around*|(|S<rsub|0>|)>>.
    Additionally, <math|#<rsub|R><around*|(|S<rsub|0>|)>+#<rsub|R><around*|(|S<rsub|1>|)>=#<rsub|R><around*|(|S|)>=#<rsub|U><around*|(|S|)>=#<rsub|U><around*|(|S<rsub|0>|)>+#<rsub|U><around*|(|S<rsub|1>|)>>
    which means that <math|#<rsub|R><around*|(|S<rsub|1>|)>+1=#<rsub|U><around*|(|S<rsub|1>|)>>.

    Now take <math|<wide|S<rsub|1>|~>> to be the path <math|S<rsub|1>> but
    with every <math|R> now a <math|U> and vice versa. We see that
    <math|#<rsub|R><around*|(|<wide|S<rsub|1>|~>|)>=#<rsub|U><around*|(|S<rsub|1>|)>=1+#<rsub|R><around*|(|S<rsub|1>|)>=#<rsub|U><around*|(|<wide|S<rsub|1>|~>|)>>.
    Thus, we see that the path <math|S<rprime|'>> (which is the combination
    of the paths <math|S<rsub|0>> and <math|<wide|S<rsub|1>|~>>) satisfies
    <math|#<rsub|R><around*|(|S<rprime|'>|)>=2+#<rsub|U><around*|(|S<rprime|'>|)>>.
    This means that <math|S<rprime|'><around*|(|0,0|)>=<around*|(|n-1,n+1|)>>
    since path <math|S<rprime|'>> has the same length as <math|S>.
    Furthermore, every path from <math|<around*|(|0,0|)>> to
    <math|<around*|(|n-1,n+1|)>> must pass through <math|y=x+1>, so can
    demonstrate a bijection between paths from <math|<around*|(|0,0|)>> to
    <math|<around*|(|n-1,n+1|)>> and those in <math|A> (if it's not obvious
    to you, see if you can figure out what the bijection is).

    This means <math|<around*|\||A|\|>=<choose|2*n|n+1>> which is the number
    of ways to choose which of the <math|2*n> terms in the sequence are going
    to be <math|U>s.

    Overall, <math|<around*|\||T\\A|\|>=<choose|2*n|n>-<choose|2n|n+1>=<choose|2*n|n><around*|(|1-<frac|n|n+1>|)>=<frac|1|n+1>*<choose|2*n|n>>.
    Q.E.F.
  </solution*>

  <\definition>
    For <math|n\<geq\>0>, we define the <math|n<rsup|<text|th>>>
    <with|font-series|bold|Catalan Number> to be

    <\equation*>
      C<rsub|n>\<assign\>*<frac|1|n+1>*<choose|2*n|n>=<frac|<around*|(|2n|)>!|n!*<around*|(|n+1|)>!>
    </equation*>
  </definition>

  <\remark>
    Note that <math|C<rsub|n>> is the solution to the previous problem.
  </remark>

  By finding bijections between the set in the first problem and sets in
  others, we know that we can relate them to the Catalan numbers as well.
  Here are some examples (note that there are many more):

  <\enumerate-numeric>
    <item>The number of well formed bracket expressions with <math|2*n>
    brackets.

    <item>The number of ways to draw <math|n> non-overlapping chords between
    the <math|2*n> verticies of a convex <math|2*n>-gon such that every
    vertex is only part of 1 chord.
  </enumerate-numeric>

  \;
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
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>What
      is Divisibility?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Introduction
      to Modular Arithmetic> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Putting
      it Together> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>