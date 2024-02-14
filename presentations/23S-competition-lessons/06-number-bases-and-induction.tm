<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Number Bases and Induction>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  <section|Number Bases>

  We often write numbers in base 10, which is to say that the position of any
  digit in the number represents a power of 10 that is multiplied by the
  number. Consider <math|342=3\<cdot\>10<rsup|2>+4\<cdot\>10+2>. We can use
  another number to achieve a different number base.

  <\definition>
    Given <math|n\<in\>\<bbb-Z\>>, and a number base <math|b>, the
    <with|font-series|bold|base <math|b> representation of <math|n>>,
    <math|<wide|d<rsub|k>d<rsub|k-1>\<ldots\>d<rsub|1>d<rsub|0>|\<bar\>><rsub|<around*|(|b|)>>>,
    satisfies

    <\equation*>
      n=<big|sum><rsup|k><rsub|i=0>d<rsub|k>\<cdot\>b<rsup|k>
    </equation*>

    where <math|0\<leq\>d<rsub|i>\<less\>b> and
    <math|d<rsub|i>\<in\>\<bbb-Z\>> for all integers <math|i>.
  </definition>

  <section|Principle of Mathematical Induction>

  <\theorem>
    <dueto|Principle of Mathematical Induction>Let <math|P(n)> be a statement
    that depends on a <math|n\<in\>\<bbb-Z\><rsup|+>>. If <math|P(1)> is true
    (called the <with|font-series|bold|base case>), and if
    <math|<around*|(|\<forall\>k\<in\>\<bbb-Z\><rsup|+>|)><around*|(|P<around*|(|k|)>\<Rightarrow\>P<around*|(|k+1|)>|)>>
    (called the <with|font-series|bold|inductive step>), then <math|P(n)> is
    true for all positive integers <math|n>.
  </theorem>

  <\exercise>
    Let <math|n\<in\>\<bbb-Z\><rsup|+>>. Show that

    <\enumerate-numeric>
      <item><math|1+2+\<cdots\>+n=<dfrac|n*<around*|(|n+1|)>|2>>

      <item><math|1<rsup|2>+2<rsup|2>+\<cdots\>+n<rsup|2>=<dfrac|n*<around*|(|n+1|)>*<around*|(|2*n+1|)>|6>>
    </enumerate-numeric>
  </exercise>

  <\theorem>
    <dueto|Strong Induction>Let <math|P(n)> be a statement that depends on a
    <math|n\<in\>\<bbb-Z\><rsup|+>>. If <math|P(1)> is true, and if
    <math|<around*|(|\<forall\>k\<in\>\<bbb-Z\><rsup|+>|)><around*|(|<around*|(|P<around*|(|1|)>\<wedge\>P<around*|(|2|)>\<wedge\>\<cdots\>\<wedge\>P<around*|(|k|)>|)>\<Rightarrow\>P<around*|(|k+1|)>|)>>,
    then <math|P(n)> is true for all positive integers <math|n>.
  </theorem>

  When using induction, it may not be true that what you are trying to prove
  can be proven by induction. The result which you are trying to prove may be
  too weak result to give you enough information for the inductive step. In
  such a case, change the statement to something stronger. For example,
  consider the following:

  <\example>
    <dueto|AoPS Induction Handout>It is true that for all <math|n\<geq\>1>,
    we have\ 

    <\equation*>
      1+<frac|1|2<rsup|2>>+<frac|1|3<rsup|2>>+\<ldots\>+<frac|1|n<rsup|2>>\<less\>2
    </equation*>

    but proving this is not possible with induction. We have to instead prove
    a stronger result with induction, that for all <math|n\<geq\>1>, we have

    <\equation*>
      1+<frac|1|2<rsup|2>>+<frac|1|3<rsup|2>>+\<ldots\>+<frac|1|n<rsup|2>>\<less\>2-<frac|1|n>
    </equation*>
  </example>

  <section|2022 Korean Junior Math Olympiad Q3>

  <\problem*>
    For a given odd prime number <math|p>, define <math|f<around*|(|n|)>> the
    remainder of <math|d> divided by <math|p>, where <math|d> is the biggest
    divisor of <math|n> which is not a multiple of <math|p>. For example when
    <math|p=5>, <math|f<around*|(|6|)>=1,f<around*|(|35|)>=2,f<around*|(|75<rsub|>|)>=3>.
    Define the sequence <math|a<rsub|1>,a<rsub|2>,\<ldots\>,a<rsub|n>,\<ldots\>>
    of integers as the followings:

    <\itemize-dot>
      <item><math|a<rsub|1>=1>

      <item><math|a<rsub|n+1>=a<rsub|n>+<around*|(|-1|)><rsup|f<around*|(|n|)>+1>>
    </itemize-dot>

    Determine all integers <math|m>, such that there exist infinitely many
    positive integers <math|k> such that <math|m=a<rsub|k>>.
  </problem*>

  <\lemma>
    If we write <math|n> in base <math|p> as
    <math|n=<wide|c<rsub|k>c<rsub|k-1>\<ldots\>c<rsub|1>c<rsub|0>0\<ldots\>0|\<bar\>><rsub|<around*|(|p|)>><rsub|>>,
    where <math|c<rsub|0>\<neq\>0>, then we see that
    <math|f<around*|(|n|)>=c<rsub|0>>.
  </lemma>

  <\proof>
    Since we know that <math|p\<nmid\>d>, and that <math|d\<barsuchthat\>n>,
    we can write <math|n=p<rsup|e>*d>. Additionally, there is a <math|q> such
    that <math|d=p*q+f<around*|(|n|)>> where <math|f<around*|(|n|)>\<less\>p>
    (since it is the remainder when <math|d> is divided by <math|p>). Taking
    these together, we see that\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|n>|<cell|=>|<cell|p<rsup|e><around*|(|p*q+f<around*|(|n|)>|)>>>|<row|<cell|>|<cell|=>|<cell|p<rsup|e+1>*q+p<rsup|e>*f<around*|(|n|)>>>|<row|<cell|>|<cell|=>|<cell|p<rsup|e+1>*q+f<around*|(|n|)>*p<rsup|e>+0\<cdot\>p<rsup|e-1>*+0\<cdot\>p<rsup|e-2>+\<cdots\>+0\<cdot\>p<rsup|1>+0\<cdot\>p<rsup|0>*>>>>
    </eqnarray*>

    Thus, the last non-zero digit of <math|n> in base <math|p> is
    <math|f<around*|(|n|)>>. Therefore, <math|c<rsub|0>=f<around*|(|n|)>> as
    desired.
  </proof>

  <\lemma>
    If <math|n=<wide|c<rsub|k>c<rsub|k-1>\<ldots\>c<rsub|1>c<rsub|0>|\<bar\>><rsub|<around*|(|p|)>>>,
    then <math|a<rsub|n+1>=1+<big|sum><rsub|i=1><rsup|k><around*|(|c<rsub|i><space|0.5em>mod
    2|)>>. Here, <math|<around*|(|x<space|0.5em>mod 2|)>> is an operation
    with value 0 or 1.\ 
  </lemma>

  <\proof>
    You can observe this by doing examples, and it can be proven with
    induction.

    <with|font-series|bold|Base case:> <math|n=1>

    <\indent>
      In this base case, we indeed have that
      <math|a<rsub|2>=a<rsub|1>+<around*|(|-1|)><rsup|f<around*|(|1|)>+1>=a<rsub|1>+1=2=1+<around*|(|1<space|0.5em>mod
      2|)>> as desired.
    </indent>

    <with|font-series|bold|Inductive step:> Assuming that if
    <math|l=<wide|c<rsub|k>c<rsub|k-1>\<ldots\>c<rsub|1>c<rsub|0>|\<bar\>><rsub|<around*|(|p|)>>>
    satisfies <math|a<rsub|l+1>=1+<big|sum><rsub|i=1><rsup|l><around*|(|c<rsub|i><space|0.5em>mod
    2|)>>, we will show that <math|l+1=<wide|d<rsub|k>d<rsub|k-1>\<ldots\>d<rsub|1>d<rsub|0>|\<bar\>><rsub|<around*|(|p|)>>>
    satisfies <math|a<rsub|l+2>=1+<big|sum><rsub|i=1><rsup|l+1><around*|(|d<rsub|i><space|0.5em>mod
    2|)>>.

    <\indent>
      Let <math|j> be the smallest integer such that
      <math|c<rsub|j>\<neq\>p-1>. Now, we see that
      <math|l+1=<wide|c<rsub|k>c<rsub|k-1>\<ldots\>c<rsub|j+1><around*|(|c<rsub|j>+1|)>0\<ldots\>0|\<bar\>><rsub|<around*|(|p|)>>>,
      thus <math|d<rsub|i>=c<rsub|i>> if <math|i\<gtr\>j>,
      <math|d<rsub|i>=c<rsub|i+1>> if <math|i=j>, and <math|d<rsub|i>=0>
      otherwise. Then,

      <\eqnarray*>
        <tformat|<table|<row|<cell|a<rsub|l+2>>|<cell|=>|<cell|a<rsub|l+1>+<around*|(|-1|)><rsup|f<around*|(|l+1|)>+1>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=0><rsup|k><around*|(|c<rsub|i><space|0.5em>mod
        2|)>|)>+<around*|(|-1|)><rsup|f<around*|(|l+1|)>+1>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=j+1><rsup|k><around*|(|c<rsub|i><space|0.5em>mod
        2|)>|)>+<around*|(|c<rsub|j><space|0.5em>mod
        2|)>+<around*|(|-1|)><rsup|f<around*|(|l+1|)>+1>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=j+1><rsup|k><around*|(|c<rsub|i><space|0.5em>mod
        2|)>|)>+<around*|(|c<rsub|j><space|0.5em>mod
        2|)>+<around*|(|-1|)><rsup|c<rsub|j>+1+1>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=j+1><rsup|k><around*|(|c<rsub|i><space|0.5em>mod
        2|)>|)>+<around*|(|c<rsub|j>+1<space|0.5em>mod
        2|)>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=j+1><rsup|k><around*|(|d<rsub|i><space|0.5em>mod
        2|)>|)>+<around*|(|d<rsub|j><space|0.5em>mod
        2|)>>>|<row|<cell|>|<cell|=>|<cell|1+<around*|(|<big|sum><rsub|i=0><rsup|k><around*|(|d<rsub|i><space|0.5em>mod
        2|)>|)>>>>>
      </eqnarray*>

      Which is what we wanted to show.
    </indent>

    Thus, the induction is complete, and the lemma is proven
  </proof>

  Now, for any <math|m\<in\>\<bbb-Z\>, m\<gtr\>1>, let
  <math|s\<assign\><frac|<around*|(|p<rsup|m>-1|)>|<around*|(|p-1|)>>>. From
  Lemma 2, we see that for any non-negative <math|i>, we have
  <math|a<rsub|s*\<cdot\>p<rsup|i>+1>=m<rsub|>> because
  <math|s*\<cdot\>p<rsup|i>> has the form
  <math|<wide|<wide*|11\<ldots\>1|\<wide-underbrace\>><rsub|m\<times\>><wide*|00\<ldots\>0|\<wide-underbrace\>><rsub|i\<times\>>|\<bar\>>
  <rsub|<around*|(|p|)>>>.\ 

  And when <math|m=1>, note that for any non-negative integer <math|i>, we
  have <math|a<rsub|2*p<rsup|i>+1>=m> since
  <math|2*p<rsup|i>=<wide|2<wide*|00\<ldots\>0|\<wide-underbrace\>><rsub|i\<times\>>|\<bar\>>
  <rsub|<around*|(|p|)>>>.\ 

  Thus, <math|<around*|(|\<forall\>m\<in\>\<bbb-Z\><rsup|+>|)><around*|(|\<exists\><text|
  infinitely many >k\<in\>\<bbb-Z\><rsup|+>|)><around*|(|m=a<rsub|k>|)>>.
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Number
      Bases> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Principle
      of Mathematical Induction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>2022
      Korean Junior Math Olympiad Q3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>