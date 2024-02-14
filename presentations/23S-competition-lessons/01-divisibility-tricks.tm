<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Divisibility Tricks>|<doc-author|<author-data|<author-name|Arnav
  Kumar>>>>

  In contests, there are many instances where we may seek fast ways to decide
  if a number divides another. This will explore tricks that help determine
  divisibility, and in the process of doing so, will introduce modular
  arithmetic. This introduction is not formal in any sense, and assumes
  certain knowledge.

  <section|What is Divisibility?>

  <\definition>
    Let <math|m,n\<in\>\<bbb-Z\>>. We say that <math|m>
    <with|font-series|bold|divides> <math|n> if there exists some
    <math|k\<in\>\<bbb-Z\>> such that <math|k*m*=n>. This is notated as
    <math|m\<divides\>n>. We can also say that <math|n> is an (integer)
    <with|font-series|bold|multiple> of <math|m>.
  </definition>

  <\note>
    This definition means that for all <math|a\<in\>\<bbb-Z\>>, we have
    <math|a\<divides\>0> since <math|0\<times\>a=0>. Additionally,
    <math|0\<divides\>a> if and only if <math|a=0>.
  </note>

  <section|Introduction to Modular Arithmetic>

  Given an arbitrary integer, <math|n>, we can express all of the multiples
  of <math|n> as a set, namely <math|<around*|{|k*n\<suchthat\>k\<in\>\<bbb-Z\>|}>>.
  What about the rest of the integers? We seem to have created some sort of
  set of numbers, each a \Pdistance\Q <math|n> from its neighbour, all of
  which are divisible by <math|n>.

  What if we consider those numbers which aren't divisible by <math|n>, but
  always yield the same \Premainder\Q when divided by <math|n>? Perhaps this
  question is a weird one if you start to think about negative numbers, so
  let's rephrase what we want to say. Instead, consider the set of numbers,
  which are divisible by <math|n> upon subtracting a fixed integer <math|a>
  from it. This refers to the set <math|<around*|{|k*n+a\<suchthat\>k\<in\>\<bbb-Z\>|}>>.

  <\definition>
    Given a positive integer <math|n>, and an integer <math|a>, we say
    <math|<around*|[|a|]><rsub|n>\<assign\><around*|{|k*n+a\<suchthat\>k\<in\>\<bbb-Z\>|}>>
    is a <with|font-series|bold|congruence class>,
    <with|font-series|bold|residue class>, or
    <with|font-series|bold|equivalence class>. It is often implicit what the
    value of <math|n> is, and we can instead write <math|<wide|a|\<bar\>>> to
    refer to <math|<around*|[|a|]><rsub|n>>. For any two
    <math|b,c\<in\><wide|a|\<bar\>>>, we say that <math|b> and <math|c> are
    congruent <with|font-series|bold|modulo <math|n>> which can be denoted as
    <math|b\<equiv\>c <around*|(|mod n|)>>. When it is obvious what the
    modulus is, we can omit the <math|<around*|(|mod n|)>>.
  </definition>

  <\remark>
    As an aside, the notation <math|\<bbb-Z\><rsub|n>> is used to refer to
    <math|<around*|{|<around*|[|x|]><rsub|n>\<suchthat\>x\<in\>\<bbb-Z\>|}>>,
    the set of congruence classes modulo <math|n>. This may seem confusing as
    it is a set of sets, but is something you don't have to worry about.
  </remark>

  Now we can take some time to familiarize ourselves with what this means.
  For the integers, our definition of congruence classes gives us exactly
  what we want, all of the numbers which have a certain remainder when
  divided by <math|n>. These numbers are spaced every <math|n> numbers away
  from each other as well. An easy way to interpret a congruence relation is
  then to say that when dividing both sides by <math|n>, they yield the same
  remainder. This seems like a logical next step to help us determine
  divisibility tricks since <math|n\<divides\>m> if and only if
  <math|m\<equiv\>0 <around*|(|mod n|)>>.

  Playing around with the definitions given produces the following basic
  results:

  <\theorem>
    <dueto|Properties of Modular Arithmetic>If
    <math|n,m\<in\>\<bbb-Z\><rsub|\<gtr\>0>>, and
    <math|a,b,c,d\<in\>\<bbb-Z\>>, then we see that:

    <\itemize-dot>
      <item>If <math|a\<equiv\>b <around*|(|mod n|)>> and <math|c\<equiv\>d
      <around*|(|mod n|)>>, then <math|a+c\<equiv\>b+d <around*|(|mod n|)>>

      <item>If <math|a\<equiv\>b <around*|(|mod n|)>> and <math|c\<equiv\>d
      <around*|(|mod n|)>>, then <math|a*c\<equiv\>b*d <around*|(|mod n|)>>

      <item>If <math|a\<equiv\>b <around*|(|mod n|)>>, then
      <math|a<rsup|m>\<equiv\>b<rsup|m> <around*|(|mod n|)>>
    </itemize-dot>
  </theorem>

  <section|Putting it Together>

  So how does this relate back to divisibility and what is useful about this?
  Modular arithmetic is a very powerful idea in mathematics that helps you
  prove or disprove certain number theory propositions since it helps you say
  something about the behaviour of an entire set of numbers. It is often a
  technique to break problems into cases based on the congruence class of a
  variable, such as breaking a problem based on even or odd (which is just
  modulo <math|2>). Now let's dive into some divisibility tricks.

  <\theorem>
    <dueto|Divisibility Tricks>Let <math|n\<in\>\<bbb-N\>> be arbitrary where
    <math|0\<nin\>\<bbb-N\>>.\ 

    Let <math|d<rsub|k>\<of\>\<bbb-N\>\<rightarrow\>\<bbb-N\>> be a function
    that returns the last <math|k> digits of the input.\ 

    Let <math|s\<of\>\<bbb-N\>\<rightarrow\>\<bbb-N\>> be a function which
    returns the sum of the digits of the input.

    Let <math|s<rprime|'>\<of\>\<bbb-N\>\<rightarrow\>\<bbb-N\>> be the sum
    of digits of its input with alternating sign, where the units digit is
    positive.

    Let <math|s<rprime|''>\<of\>\<bbb-N\>\<rightarrow\>\<bbb-N\>> be the sum
    of the two digit pairs of its input where the ones and tens digits are
    paired together.

    <\itemize-dot>
      <item><math|2\<divides\>n> if and only if
      <math|2\<divides\>d<rsub|1><around*|(|n|)>>.

      <item><math|3\<divides\>n> if and only if
      <math|3\<divides\>s<around*|(|n|)>>.

      <item><math|4\<divides\>n> if and only if
      <math|4\<divides\>d<rsub|2><around*|(|n|)>>.

      <item><math|5\<divides\>n> if and only if
      <math|5\<divides\>d<rsub|1><around*|(|n|)>>.

      <item><math|6\<divides\>n> if and only if <math|2\<divides\>n> and
      <math|3\<divides\>n>.

      <item>Let <math|a,b\<in\>\<bbb-Z\><rsub|\<geqslant\>0>> with
      <math|0\<leqslant\>b\<less\>10> such that <math|n=10*a+b>. Now,
      <math|7\<divides\>n> if and only if <math|7\<divides\>a-2*b>.

      <item><math|8\<divides\>n> if and only if
      <math|8\<divides\>d<rsub|3><around*|(|n|)>>.

      <item><math|9\<divides\>n> if and only if
      <math|9\<divides\>s<around*|(|n|)>>.

      <item><math|10\<divides\>n> if and only if the last digit of <math|n>
      is <math|0>.

      <item><math|11\<divides\>n> if and only if
      <math|11\<divides\>s<rprime|'><around*|(|n|)>> if and only if
      <math|11\<divides\>s<rprime|''><around*|(|n|)>>.\ 
    </itemize-dot>
  </theorem>

  <\remark>
    There is nothing special about what we did for these numbers. The only
    important facts to consider are that we get nice results when considering
    numbers which divide a power of <math|10>, or who have a multiple which
    is very close to a power of <math|10>. Additionally, when the divisor is
    composite (like <math|6>), it may be useful to separate it into a product
    of coprime numbers.
  </remark>

  <section|Exercises>

  <\exercise>
    <dueto|1999 IMC A1>Find the remainder when
    122333444455555666666777777788888888999999999 is divided by 9.
  </exercise>

  <\exercise>
    Find a divisibility trick for 37.
  </exercise>

  <\exercise>
    <dueto|1999 IMC A3>How many of the numbers
    <math|1<rsup|2>,2<rsup|2>,\<ldots\>,1999<rsup|2>> have odd numbers in
    their tens digit?
  </exercise>

  <\exercise>
    <dueto|2000 IMC A1>Find the units digit of <math|17<rsup|2000>>.
  </exercise>

  <\exercise>
    <dueto|1993 MMO A1>Denote by <math|S<around*|(|x|)>> the sum of the
    digits of a positive integer <math|x>. Solve the following:

    <\enumerate-alpha>
      <item><math|x+S<around*|(|x|)>+S<around*|(|S<around*|(|x|)>|)>=1993>

      <item><math|x+S<around*|(|x|)>+S<around*|(|S<around*|(|x|)>|)>+S<around*|(|S<around*|(|S<around*|(|x|)>|)>|)>=1993>
    </enumerate-alpha>
  </exercise>

  IMC refers to the Junior High School Division International Mathematics
  Competition and MMO refers to the Moscow Mathematics Olympiad.
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