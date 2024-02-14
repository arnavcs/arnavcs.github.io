<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Tricks with Finite Series and
  Products>|<doc-author|<author-data|<author-name|Arnav Kumar>>>>

  We often come across series and products that seem quite difficult to
  compute, but with some tricks, we can simplify the problem significantly.
  This involves being able to correctly identify when a series or product
  telescopes and being able to pair or group terms in a way which simplifies
  the sum or product.\ 

  This handout is aimed to only deal with finite series and products, since
  extra caution and completely different rules apply when dealing with
  infinite series and products.

  <section|Telescoping Series and Products>

  There are multiple instances where a given series (consisting of several
  terms) can be simplified to a value that does not require the full
  computation of the sum. The nature of the sum means that terms in the
  middle cancel out with each other.

  <\example>
    Suppose we want to evaluate <math|<frac|1|1\<times\>2>+<frac|1|2\<times\>3>+<frac|1|3\<times\>4>+\<cdots\>+<frac|1|19\<times\>20>>.
    Notice that

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|1|1\<times\>2>+<frac|1|2\<times\>3>+<frac|1|3\<times\>4>+\<cdots\>+<frac|1|19\<times\>20>>|<cell|=>|<cell|<big|sum><rsup|19><rsub|n=1><frac|1|n*<around*|(|n+1|)>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|19><rsub|n=1><frac|1|n*>-<frac|1|*n+1>>>|<row|<cell|>|<cell|=>|<cell|1-<frac|1|20>>>>>
    </eqnarray*>

    Thus our answer is <tabular|<tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|1ln>|<cwith|1|1|1|1|cell-rborder|1ln>|<table|<row|<cell|<math|<frac*|19|20>>>>>>>.
  </example>

  As we saw in the previous example, we were able to express each term in a
  way that meant that it canceled out with its neighbours. A similar process
  is the case for telescoping products.

  This next example uses the Fibonacci numbers which can be defined quite
  nicely with recursion.

  <\definition>
    We define the <with|font-series|bold|Fibonacci sequence> recursively,
    where for <math|n\<in\>\<bbb-Z\><rsup|\<geqslant\>0>>, the
    <math|n><rsup|th> Fibonacci number is given by

    <\equation*>
      F<rsub|n>\<assign\><around*|{|<tabular|<tformat|<table|<row|<cell|n>|<cell|<text|if
      >n\<leq\>1>>|<row|<cell|F<rsub|n-1>+F<rsub|n-2>>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
    </equation*>
  </definition>

  <\problem>
    Express the following sum as a function of <math|F<rsub|99>>,
    <math|F<rsub|100>>, and <math|F<rsub|101>>:

    <\equation*>
      <frac|1|F<rsub|0>*F<rsub|2>>+<frac|1|F<rsub|1>*F<rsub|3>>+\<cdots\>+<frac|1|F<rsub|99>*F<rsub|101>>
    </equation*>
  </problem>

  So far, what we've been doing in the last two examples is splitting up some
  sort of expression in the denominator in a way that leaves us with two
  terms that cancel out with neighbours. This method of breaking a term down
  into two terms is an informal introduction to
  <with|font-series|bold|partial fraction decomposition>. Not all telescoping
  series use this method, as you will see in the exercises.

  <section|Term Grouping>

  Choosing to group terms differently is a very effective strategy in making
  a difficult sum become approachable.

  As a testimony to this, the derivation of the formula for an arithmetic
  series can be done with term grouping.

  <\theorem>
    <dueto|Finite Arithmetic Series>For <math|a,d\<in\>\<bbb-R\>> and
    <math|n\<in\>\<bbb-Z\><rsup|+>>, we have the following:

    <\equation*>
      a+<around*|(|a+d|)>+<around*|(|a+2*d|)>+\<cdots\>+<around*|(|a+<around*|(|n-1|)>*d|)>=<big|sum><rsup|n-1><rsub|i=0><around*|(|a+i*d|)>=<frac|1|2>*n*<around*|(|2*a+<around*|(|n-1|)>*d|)>
    </equation*>
  </theorem>

  Furthermore, term grouping can help out with reducing unfamiliar sums if we
  are well acquainted with some standard sums.

  <section|Common Series>

  This is a good place to introduce the equivalent formula for a finite
  geometric series and some other sums that are very common. It is advised to
  have these memorized.

  <\theorem>
    <dueto|Finite Geometric Series>For <math|a,r\<in\>\<bbb-R\>>,
    <math|r\<neq\>1>, and <math|n\<in\>\<bbb-Z\><rsup|+>>, we have that

    <\equation*>
      a+a*r+a*r<rsup|2>+\<cdots\>+a*r<rsup|n-1>=<big|sum><rsup|n-1><rsub|i=0>a*r<rsup|i>=a*<frac|r<rsup|n>-1|r-1>
    </equation*>
  </theorem>

  <\theorem>
    <dueto|Sum of Powers of Natural Numbers>Let <math|n\<in\>\<bbb-N\>>. Now,
    we have the following results:

    <\enumerate-numeric>
      <item><math|1+2+\<cdots\>+n=<frac|n*<around*|(|n+1|)>|2>>

      <item><math|1<rsup|2>+2<rsup|2>+\<cdots\>+n<rsup|2>=<frac|n*<around*|(|n+1|)>*<around*|(|2*n+1|)>|6>>

      <item><math|1<rsup|3>+2<rsup|3>+\<cdots\>+n<rsup|3>=<around*|(|<frac|n*<around*|(|n+1|)>|2>|)><rsup|2>>
    </enumerate-numeric>
  </theorem>

  <\note>
    Proofs to all of these common series can be done with mathematical
    induction.
  </note>

  <section|Exercises>

  <\exercise>
    <dueto|1999 IMC A5>Calculate <math|1999<rsup|2>-1998<rsup|2>+1997<rsup|2>-1996<rsup|2>+\<cdots\>+3<rsup|2>-2<rsup|2>+1<rsup|2>>
  </exercise>

  <\exercise>
    Evaluate the following if <math|n=10>:

    <\equation*>
      <big|sum><rsup|n-1><rsub|i=0><around*|(|i+2|)><around*|(|i+1|)>
    </equation*>
  </exercise>

  <\exercise>
    <dueto|2009 IMC A6>Simplify as a fraction in lowest terms

    <\equation*>
      <frac|<around*|(|2<rsup|4>+2<rsup|2>+1|)><around*|(|4<rsup|4>+4<rsup|2>+1|)>\<cdots\><around*|(|10<rsup|4>+10<rsup|2>+1|)>|<around*|(|3<rsup|4>+3<rsup|2>+1|)><around*|(|5<rsup|4>+5<rsup|2>+1|)>\<cdots\><around*|(|11<rsup|4>+11<rsup|2>+1|)>>
    </equation*>
  </exercise>

  <\exercise>
    <dueto|Brilliant>Evaluate

    <\equation*>
      <frac|1|<sqrt|1>+<sqrt|2>>+<frac|1|<sqrt|2>+<sqrt|3>>+\<cdots\>+<frac|1|<sqrt|99>+<sqrt|100>>
    </equation*>
  </exercise>

  \;

  IMC refers to the Junior High School Division International Mathematics
  Competition.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Telescoping
      Series and Products> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Term
      Grouping> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Common
      Series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>