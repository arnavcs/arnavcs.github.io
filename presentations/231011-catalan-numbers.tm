<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|The Catalan Numbers>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  <section|Background Knowledge>

  <\definition>
    Given sets <math|A> and <math|B>. Additionally, the
    <with|font-series|bold|set difference> <math|A\\B> is the set of
    everything in <math|A> which is not in <math|B>.
  </definition>

  <\exercise>
    <dueto|<math|\<star\>>>Given sets <math|A,B>, the set <math|A\<cap\>B> is
    the <with|font-series|bold|intersection> between <math|A> and <math|B>
    and contains everything which is in both <math|A> and <math|B>. Show that
    <math|A> can be partitioned into <math|A\\B> and <math|A\<cap\>B> so that
    everything in <math|A> is in exactly one of <math|A\\B> and
    <math|A\<cap\>B>, and nothing is contained either <math|A\\B> or
    <math|A\<cap\>B> which is not in <math|A>.
  </exercise>

  <\definition>
    A <with|font-series|bold|bijection> between two sets <math|A> and
    <math|B> is a map from set <math|A> to set <math|B>,
    <math|f\<of\>A\<rightarrow\>B>, such that for any <math|b\<in\>B> there
    is a unique <math|a\<in\>A> satisfying <math|f<around*|(|a|)>=b>. Any
    <math|f\<of\>A\<rightarrow\>B> is <with|font-series|bold|bijective> if it
    is a bijection.
  </definition>

  <\exercise>
    <dueto|<math|\<star\>>>Show that if <math|f\<of\>A\<rightarrow\>B> is a
    bijection, then it is invertible. Being invertible means that there is a
    function <math|g\<of\>B\<rightarrow\>A> such that for any <math|a\<in\>A>
    and any <math|b\<in\>B> we have <math|f<around*|(|g<around*|(|b|)>|)>=b>
    and <math|g<around*|(|f<around*|(|a|)>|)>=a>.
  </exercise>

  <\notation>
    If <math|S> is a set with a finite number of elements in it, we use
    <math|<around*|\||S|\|>> to notate the number of elements in <math|S>.
  </notation>

  <\remark*>
    This idea can be generalized to any set, but is not easy to define and
    thus omitted. If you are interested, it is called the
    <with|font-series|bold|cardinality> of a set.
  </remark*>

  <\proposition>
    Let <math|A> and <math|B> be sets (not necessarily finite). If there is a
    <math|f\<of\>A\<rightarrow\>B> which is bijective, we have that
    <math|<around*|\||A|\|>=<around*|\||B|\|>>.
  </proposition>

  <\exercise>
    <dueto|<math|\<star\>>>Show that <math|<around*|\||<around*|[|0,1|]>|\|>=<around*|\||<around*|[|0,7|]>|\|>>
    where <math|<around*|[|a,b|]>> is the set of all real numbers <math|x>
    satisfying <math|a\<leq\>x\<leq\>b>.
  </exercise>

  <\exercise>
    <dueto|<math|\<star\>>>Show that <math|<around*|\||<around*|(|0,1|)>|\|>=<around*|\||<around*|(|1,\<infty\>|)>|\|>>
    where <math|<around*|(|a,b|)>> is the set of all real numbers <math|x>
    satisfying <math|a\<less\>x\<less\>b> and we have that every
    <math|x\<in\>\<bbb-R\>> satisifes <math|x\<less\>\<infty\>>. (Note here
    that <math|\<infty\>> is not a real number, but is a part of what is
    called the extended reals, <math|<wide|\<bbb-R\>|\<bar\>>>).
  </exercise>

  <\definition>
    For <math|n\<in\>\<bbb-N\>=<around*|{|0\<nocomma\>,1,2,\<ldots\>|}>> we
    define <with|font-series|bold|<math|n> factorial> to be
    <math|n!=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >n=0>>|<row|<cell|n\<times\><around*|(|n-1|)>!>|<cell|<text|otherwise>>>>>>>.
  </definition>

  <\exercise>
    <dueto|<math|\<star\>\<star\>>>Show that the number of ways to order
    <math|n> distinct objects is <math|n!>.
  </exercise>

  <\exercise>
    <dueto|<math|\<star\>\<star\>>>The number of ways to choose <math|k>
    objects from a collection of <math|n> distinct objects where the
    selection order matters is called <with|font-series|bold|<math|n> permute
    <math|k>> (sometimes denoted <math|<rsub|n>P<rsub|k>>). The
    <with|font-series|bold|falling factorial> of <math|n> and <math|k> is
    <math|n<rsup|<underline|k>>=n\<times\><around*|(|n-1|)>\<times\>\<cdots\>\<times\><around*|(|n-k+1|)>>
    and is sometimes denoted <math|<around*|(|n|)><rsub|k>>. Show that when
    <math|n> and <math|k> are non-negative integers with <math|k\<leq\>n>, we
    have that <math|n<rsup|<underline|k>>=<frac|n!|<around*|(|n-k|)>!>> is
    the same as <math|n> permute <math|k>.
  </exercise>

  <\notation>
    We use <math|<choose|n|k>> (or sometimes <math|<rsub|n>C<rsub|k>>) to
    notate the number of ways to choose <math|k> objects from a collection of
    <math|n> distinct objects where selection order does not matter.
  </notation>

  <\exercise>
    <dueto|<math|\<star\>\<star\>>>Show that
    <math|<choose|n|k>=<frac|n<rsup|<underline|k>>|k!>=<frac|n!|k!*<around*|(|n-k|)>!>>.
  </exercise>

  <section|Motivation for the Catalan Numbers>

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

  <section|The Catalan Numbers>

  <\definition>
    For <math|n\<geq\>0>, we define the <math|n<rsup|<text|th>>>
    <with|font-series|bold|Catalan number> to be
    <math|C<rsub|n>\<assign\>*<frac|1|n+1>*<choose|2*n|n>=<frac|<around*|(|2n|)>!|n!*<around*|(|n+1|)>!>>.
  </definition>

  <\remark*>
    Note that <math|C<rsub|n>> is the solution to the previous problem. By
    finding bijections between the set we are counting in the first problem
    and sets we are counting in others, we can find alternate, equivalent
    characterizations of the Catalan numbers.
  </remark*>

  <\exercise>
    <dueto|<math|\<star\>>>A well formed bracket expressions is an example of
    a <with|font-series|bold|Dyck word>. Show that the number of well-formed
    bracket expressions with <math|*n> bracket pairs is <math|C<rsub|n>>.
  </exercise>

  <\exercise>
    <dueto|<math|\<star\>\<star\>>>Based on the interpretation of Catalan
    numbers as in the previous exercise, show that we can find an recursive
    formula for <math|C<rsub|n>> of the form
    <math|C<rsub|n>=C<rsub|0>*C<rsub|n-1>+C<rsub|1>*C<rsub|n-2>+\<cdots\>+C<rsub|n-1>*C<rsub|0>=<big|sum><rsub|i=1><rsup|n>C<rsub|i-1>*C<rsub|n-i>>.
  </exercise>

  <\exercise>
    <dueto|<math|\<star\>>>Show <math|C<rsub|n>> is the number of ways to
    draw <math|n> non-crossing diagonals between the <math|2*n> verticies of
    a convex <math|2*n>-gon such that every vertex is only part of 1
    diagonal.
  </exercise>

  <\exercise>
    <dueto|<math|\<star\>\<star\>\<star\>>>Again, we are playing the game on
    the Cartesian plane introduced earlier. We define the
    <with|font-series|bold|exceedence> of a path from
    <math|<around*|(|0,0|)>> to <math|<around*|(|n,n|)>> as the number of
    times we move <math|U> given that we were on or above the line <math|y=x>
    initially. For any <math|k\<in\><around*|{|0,\<ldots\>,n|}>> show that
    the number of distinct paths from <math|<around*|(|0,0|)>> to
    <math|<around*|(|n,n|)>> with exceedence <math|k> is <math|C<rsub|n>>.
  </exercise>

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
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
  </collection>
</references>