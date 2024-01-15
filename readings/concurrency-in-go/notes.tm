<TeXmacs|2.1>

<style|article>

<\body>
  <doc-data|<doc-title|<with|font-shape|italic|Concurrency in Go>
  Notes>|<doc-author|<author-data|<author-name|Arnav
  Kumar>|<author-homepage|<slink|https://arnavcs.github.io>>>>>

  <\bothlined>
    <with|font-shape|italic|Concurrency in Go> is a publication by O'Reilly
    Media Inc. written by Katherine Cox-Buday. This is a collection of notes
    that I make about the text as I read it and of Golang as I learn it. This
    is not a summary or recreation of the text, but rather a reference for
    anyone who has already read the text. As such, please read the text to
    gain a better understanding of the contents.
  </bothlined>

  <section|Basic Concurrency Ideas>

  <\padded-center>
    <tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
    cyan>|<cwith|1|1|2|2|cell-background|pastel
    green>|<cwith|1|1|3|3|cell-background|pastel
    yellow>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|1|1|1|-1|cell-lborder|1ln>|<cwith|1|1|1|-1|cell-rborder|1ln>|<table|<row|<cell|Software
    / Design Pattern>|<cell|Definition>|<cell|Note>>>>>
  </padded-center>

  <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|-1|cell-halign|l>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|11|11|1|2|cell-hyphen|t>|<cwith|11|11|1|2|cell-halign|l>|<cwith|11|11|1|2|cell-lsep|1ex>|<cwith|11|11|1|2|cell-rsep|1ex>|<cwith|11|11|1|2|cell-bsep|1ex>|<cwith|11|11|1|2|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-background|pastel
  green>|<cwith|11|11|1|1|cell-background|pastel
  yellow>|<cwith|24|24|1|1|cell-background|pastel
  yellow>|<cwith|25|26|1|1|cell-background|pastel
  cyan>|<cwith|18|18|1|1|cell-background|pastel
  cyan>|<cwith|6|6|1|-1|cell-lsep|1ex>|<cwith|6|6|1|-1|cell-rsep|1ex>|<cwith|6|6|1|-1|cell-bsep|1ex>|<cwith|6|6|1|-1|cell-tsep|1ex>|<cwith|27|27|1|1|cell-background|pastel
  cyan>|<cwith|1|-1|1|1|cell-width|25ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<twith|table-hyphen|y>|<table|<row|<\cell>
    Amdahl's Law
  </cell>|<\cell>
    Amdahl's Law models the improved performance of a fixed task when the
    resources are improved. In parallel computing, it is used to predict the
    speedup of using multiple processors. The relation is given as follows:

    <\equation*>
      S<rsub|latency><around*|(|s|)>=<frac|1|<around*|(|1-p|)>+<frac|p|s>>
    </equation*>

    <tabular|<tformat|<cwith|1|-1|2|2|cell-hyphen|t>|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|1|cell-background|pastel
    green>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<cell|<math|S<rsub|latency>>>|<\cell>
      the theoretical speedup of the whole program
    </cell>>|<row|<cell|<math|s>>|<\cell>
      the speedup of the part of the task from improved resources
    </cell>>|<row|<cell|<math|p>>|<\cell>
      the proportion of the execution time that benefits from the improved
      resources
    </cell>>>>>
  </cell>>|<row|<\cell>
    Race Conditions
  </cell>|<\cell>
    A race condition is when two or more operations must execute in the
    correct order, but the program leaves the order of execution unspecified.
  </cell>>|<row|<\cell>
    Data Race
  </cell>|<\cell>
    A data race is a race condition in which two concurrent operations
    attempt to read the same data at an unspecified time (namely one that
    could potentially conflict). In the following example, the program is not
    given a specified evaluation order, so the code that follows may execute
    before, during, or even after the goroutine. As such, the output is
    indeterminate.

    <\verbatim-code>
      var data int

      go func() { data++ }()

      fmt.Printf("%v\\n", data)
    </verbatim-code>
  </cell>>|<row|<\cell>
    Atomicity
  </cell>|<\cell>
    An atomic operation is indivisible or uninterruptible in the context in
    which it is operating. For example, the statement <verbatim|i++> consists
    of 3 atomic operations: retrieving, incrementing, and storing the value
    of <verbatim|i>.
  </cell>>|<row|<\cell>
    Critical Selection
  </cell>|<\cell>
    A critical selection is a section of code that requires exclusive access
    to a shared resource. In the following code, the <verbatim|fmt.Printf()>
    and the goroutine are both critical selections.

    <\verbatim-code>
      var data int

      go func() { data++ }()

      fmt.Printf("%v\\n", data)
    </verbatim-code>
  </cell>>|<row|<\cell>
    Memory Access Synchronization
  </cell>|<\cell>
    To solve the problem of multiple critical selections, only enable one
    critical selection to access the same shared resource at a time. This can
    be achieved, for example, with a mutex.
  </cell>>|<row|<\cell>
    Deadlock
  </cell>|<\cell>
    A deadlock is a state in which all concurrent processes are waiting on
    each other. A deadlock can be identified by the Coffman Conditions.
  </cell>>|<row|<\cell>
    Coffman Conditions
  </cell>|<\cell>
    There are 4 Coffman Conditions that detect, prevent, and correct
    deadlocks. The conditions are as follows:

    <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-background|pastel
    green>|<twith|table-hyphen|n>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<\cell>
      Mutual Exclusion
    </cell>|<\cell>
      A concurrent process must hold exclusive rights to a resource at any
      one time.
    </cell>>|<row|<\cell>
      Wait For Condition
    </cell>|<\cell>
      A concurrent process must hold a resource and be waiting for another
      resource.
    </cell>>|<row|<\cell>
      No Preemption
    </cell>|<\cell>
      A resource held by a concurrent process can only be released by that
      process.
    </cell>>|<row|<\cell>
      Circular Wait
    </cell>|<\cell>
      A process must be waiting on a chain of processes which is circular
      (meaning that the process is directly or indirectly waiting on itself
      to give a result).
    </cell>>>>>
  </cell>>|<row|<\cell>
    Livelock
  </cell>|<\cell>
    A livelock is when the current concurrent processes are performing
    operations, but these operations do not terminate or move the program
    closer to termination.
  </cell>>|<row|<\cell>
    Starvation
  </cell>|<\cell>
    Starvation is a superset of a livelock or deadlock where, more generally,
    a concurrent process does not receive access to the resources it needs. A
    common example is having a \Pgreedy worker\Q hold on to access to the
    resource, while a \Ppolite worker\Q does not, and thus has less access to
    the resource: it is starved.
  </cell>>|<row|<\cell>
    \PFinding a Balance\Q
  </cell>|<\cell>
    What should the range of a memory lock be? Should it be broad and cover
    multiple critical selections, or should each critical selection get its
    own lock? It is important to strike a balance in answering this question
    because memory access synchronization is expensive, but you also want to
    avoid writing greedy processes to mitigate starvation.
  </cell>>|<row|<\cell>
    OS Threads
  </cell>|<\cell>
    OS threads are a primitive at the OS context that can be used to run
    processes concurrently. The operating system is responsible for creating
    and managing the threads. The threads all have access to a shared
    resource space.
  </cell>>|<row|<\cell>
    Green Threads
  </cell>|<\cell>
    Green threads are threads that are managed by a program's runtime.
  </cell>>|<row|<\cell>
    Preemptive and Non-preemptive Scheduling
  </cell>|<\cell>
    Preemptive scheduling is when a process may be interrupted during
    execution, whereas non-preemptive scheduling involves processes which
    cannot be interrupted, but rather just suspended at certain points.
  </cell>>|<row|<\cell>
    Coroutines
  </cell>|<\cell>
    Concurrent subroutines that are non-preemptive (meaning that they can't
    be interrupted) are called coroutines. They feature multiple points to
    suspend or reenter computation.\ 
  </cell>>|<row|<\cell>
    <verbatim|M:N> Scheduler
  </cell>|<\cell>
    A <verbatim|M:N> scheduler is the mechanism that Golang uses to host
    goroutines and it consists of mapping <verbatim|M> green threads onto
    <verbatim|N> OS threads.
  </cell>>|<row|<\cell>
    Fork-Join Model
  </cell>|<\cell>
    The model that Golang follows for concurrency, a fork-join model is one
    in which a child branch can fork off from parent to be run concurrently.
    After the termination of the child branch, it is joined back to the
    parent branch at a join point.
  </cell>>|<row|<\cell>
    Thread Pools
  </cell>|<\cell>
    Thread pools are a software design pattern that maintains a collection of
    threads to map incoming tasks to threads for concurrent execution.
  </cell>>|<row|<\cell>
    Concurrency vs. Parallelism
  </cell>|<\cell>
    Parallelism is a property of a machine to be able to run two tasks
    simultaneously in the considered context. On the other hand, concurrency
    refers to when two processes have a lifespan that overlaps. In this
    sense, you could have a concurrent program running on a single thread
    where multiple threads are simulated. It is also possible that the
    concurrent processes run in parallel.

    Concurrency is a property of the code, and parallelism is a property of
    the execution of the code.
  </cell>>|<row|<\cell>
    Process
  </cell>|<\cell>
    A process is a portion of code that requires input to run and produces an
    output that is consumed by another process. The input and output of a
    process is called <with|font-shape|right|communication> between
    processes.
  </cell>>|<row|<\cell>
    Communicating Sequential Processes (CSP)
  </cell>|<\cell>
    CSP is the name of a paper, programming language, and the idea of a
    describing programs as processes which are sequential and communicate.
    Used in the paper describing CSP, the CSP language supported the use of
    <verbatim|!> and <verbatim|?> to send input into and read output from a
    process respectively. In addition, it supported guarded commands. This is
    the style of concurrency programming that Golang's channels are based on.
  </cell>>|<row|<\cell>
    Guarded Command
  </cell>|<\cell>
    When a statement should not be executed if another statement was false or
    a command exited, it is a guarded command. The CSP example below denotes
    a process <verbatim|a>, from which a character <verbatim|c> is
    continually read (while there is something to be read), and then inputted
    into the process <verbatim|b>.

    <\verbatim-code>
      *[c:character;

      a?c -\<gtr\> b!c]
    </verbatim-code>
  </cell>>|<row|<\cell>
    Process Calculus
  </cell>|<\cell>
    Process calculus is a mathematical way to model concurrent systems and
    analyze their properties.
  </cell>>|<row|<\cell>
    Should I use CSP style or OS threads?
  </cell>|<\cell>
    The CSP style has certain advantages that it comes with, and more
    generally, the Golang developing team suggest to use the CSP style over
    primitives like <verbatim|sync.Mutex>, but there are certain guidelines
    outlined that help determine when you should use channels or OS thread
    primitives. Follow the first applicable statement.

    <with|item-vsep|0fn|<\enumerate>
      <item>If your code is performance critical, use primitives

      <item>If you are trying to transfer ownership of data, use channels

      <item>If you are trying to guard the internal structure of a struct,
      use primitives

      <item>If you are coordinating multiple pieces of logic, use channels

      <item>Use primitives
    </enumerate>>
  </cell>>|<row|<\cell>
    Mutex
  </cell>|<\cell>
    Mutex stands for \Pmutual exclusion\Q and enables a way to express
    exclusive access to a shared resource. A mutex is often used for critical
    selections.
  </cell>>|<row|<\cell>
    Object Pool
  </cell>|<\cell>
    The object pool pattern is a way to create a fixed number of objects for
    use, and is especially useful for objects that are computationally
    expensive or objects that will take a lot of memory.
  </cell>>|<row|<\cell>
    Channels
  </cell>|<\cell>
    The channel pattern comes from CSP and is a way to pass information. If
    there is nothing to be read from a channel, reading from it blocks
    execution; waiting for a value to be added to the channel. Additionally,
    channels can be closed (to stop writing to the channel), in which case
    reading from the channel further empties the channel and reading from an
    empty closed channel will indicate that the channel is closed. Channels
    can also have buffers to store values to be read later.

    As a pattern, to write robust code, separate the ownership of the channel
    so that the channel users only have read access to the channel, and the
    channel owner has the following responsibilities:

    <\enumerate>
      <item>Instantiate the channel

      <item>Perform writes or pass write ownership to another goroutine

      <item>Close the channel

      <item>Expose a reader channel for the channel users
    </enumerate>
  </cell>>>>>

  <page-break*><section|Golang Features and Building Blocks>

  <\padded-center>
    <tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
    green>|<cwith|1|1|2|2|cell-background|pastel
    yellow>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|1|1|1|-1|cell-lborder|1ln>|<cwith|1|1|1|-1|cell-rborder|1ln>|<table|<row|<cell|Type>|<cell|Function
    / Keyword>>>>>
  </padded-center>

  <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-background|pastel
  yellow>|<cwith|1|-1|1|-1|cell-halign|l>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|9|9|1|2|cell-hyphen|t>|<cwith|9|9|1|2|cell-hyphen|t>|<cwith|9|9|1|2|cell-halign|l>|<cwith|9|9|1|2|cell-lsep|1ex>|<cwith|9|9|1|2|cell-rsep|1ex>|<cwith|9|9|1|2|cell-bsep|1ex>|<cwith|9|9|1|2|cell-tsep|1ex>|<cwith|1|1|1|2|cell-hyphen|t>|<cwith|1|1|1|1|cell-background|pastel
  yellow>|<cwith|1|1|1|2|cell-halign|l>|<cwith|1|1|1|2|cell-lsep|1ex>|<cwith|1|1|1|2|cell-rsep|1ex>|<cwith|1|1|1|2|cell-bsep|1ex>|<cwith|1|1|1|2|cell-tsep|1ex>|<cwith|1|1|1|1|cell-background|pastel
  yellow>|<cwith|8|13|1|1|cell-background|pastel
  green>|<cwith|15|16|1|1|cell-background|pastel
  yellow>|<cwith|14|14|1|1|cell-background|pastel
  green>|<cwith|16|16|1|1|cell-background|pastel
  yellow>|<cwith|2|2|1|1|cell-background|pastel
  yellow>|<cwith|7|8|1|2|cell-hyphen|t>|<cwith|7|8|1|1|cell-background|pastel
  yellow>|<cwith|7|8|1|2|cell-halign|l>|<cwith|7|8|1|2|cell-lsep|1ex>|<cwith|7|8|1|2|cell-rsep|1ex>|<cwith|7|8|1|2|cell-bsep|1ex>|<cwith|7|8|1|2|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|25ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<twith|table-hyphen|y>|<table|<row|<\cell>
    <verbatim|func>
  </cell>|<\cell>
    This keyword can be used to create named functions, closures, or
    anonymous functions. A named function example is show below.

    <\verbatim-code>
      func helloWorld(numTimes int) {

      \ \ \ \ for ; numTimes \<gtr\> 0; numTimes-- {

      \ \ \ \ \ \ \ \ fmt.Printf("Hello World!\\n")

      \ \ \ \ }

      }
    </verbatim-code>

    An anonymous version of the same function is also shown below.

    <\verbatim-code>
      var f := func(numTimes int) {

      \ \ \ \ for ; numTimes \<gtr\> 0; numTimes-- {

      \ \ \ \ \ \ \ \ fmt.Printf("Hello World!\\n")

      \ \ \ \ }

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    Loops
  </cell>|<\cell>
    All loops in Golang are declared with the keyword <verbatim|for>. You can
    supply a stepping mechanism, nothing (for an infinite loop), a condition,
    or a range to describe the loop like in the examples below.

    <\verbatim-code>
      for i := 0; i \<less\> 10; i++ { fmt.Println(i) }

      for { fmt.Println("looping forever") }

      j := 0; for j \<less\> 10 { fmt.Println(j) }

      for i, v := range []int{1, 2} { fmt.Println(i, v) }
    </verbatim-code>

    Breaking out of a loop and continuing to the next iteration can be done
    with the <verbatim|break> and <verbatim|continue> keywords. Adding labels
    to loops (by preceding the loop with <verbatim|labelName:>) can specify
    which loop to <verbatim|break> or <verbatim|continue> out to. For example
    the following code prints <verbatim|0 0>.

    <\verbatim-code>
      outside:

      for i := 0; i \<less\> 2; i++ {

      \ \ \ \ for j := 0; j \<less\> 2; j++ {

      \ \ \ \ \ \ \ \ if i \<less\> j { break outside }

      \ \ \ \ \ \ \ \ fmt.Println(i, j)

      \ \ \ \ }

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|range>
  </cell>|<\cell>
    A range can be used to iterate over strings, arrays, slices, key/value
    pairs of maps, and even channels.
  </cell>>|<row|<\cell>
    <verbatim|type>
  </cell>|<\cell>
    This keyword creates a type macro, giving the second type the name passed
    into the function. For example, the following creates a new type called
    <verbatim|HouseNumber>.

    <\verbatim-code>
      type HouseNumber int
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|struct>
  </cell>|<\cell>
    A struct in Golang can be created with the <verbatim|struct {}> syntax.
    Since this creates a new type, it can be saved to a type variable with
    <verbatim|type>.

    <\verbatim-code>
      type Fruit struct {

      \ \ \ \ name string

      }

      var apple Fruit = Fruit{"Apple"}
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|interface>
  </cell>|<\cell>
    Interfaces in Golang can be declared as follows. Here again, we use
    <verbatim|type> to assign a name to this <verbatim|interface>.

    <\verbatim-code>
      type Plant interface {

      \ \ \ \ getHeight() float

      \ \ \ \ getSpecies() string

      }
    </verbatim-code>

    Additionally, the existence of the empty <verbatim|interface> in Go is
    special, because all types satisfy the empty interface, meaning it can
    hold any value. It is <verbatim|interface{}>.
  </cell>>|<row|<\cell>
    <verbatim|go>
  </cell>|<\cell>
    Creates a <with|font-shape|italic|goroutine> that runs the function,
    method, or closure concurrently by multiplexing onto OS threads. Each
    goroutine is a special class of coroutine where you do not have to
    manually describe the suspension and resuming of the routine. At runtime,
    Golang automatically suspends goroutines when they are blocked and
    resumes them when they are unblocked. Goroutines use the fork-join model
    for concurrency and during runtime, a <verbatim|M:N> scheduler is used.
    See the following example using goroutines modified from the textbook
    that uses closures to print <verbatim|"go">, <verbatim|"rust">, and
    <verbatim|"c"> concurrently in an unspecified order.

    <\verbatim-code>
      var wg sync.WaitGroup

      for _, lang := range []string{"go", "rust", "c"} {

      \ \ \ \ wg.Add(1)

      \ \ \ \ go func(l string) {

      \ \ \ \ \ \ \ \ defer wg.Done()

      \ \ \ \ \ \ \ \ fmt.Println(l)

      \ \ \ \ }(lang)

      }

      wg.Wait()
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|defer>
  </cell>|<\cell>
    Defers the execution of the statement to the end of the function. In the
    following example, the mutex isn't unlocked until the after the value of
    <verbatim|data> increments.

    <\verbatim-code>
      var data int = 0

      var mu sync.Mutex

      func inc() {

      \ \ \ \ mu.Lock()

      \ \ \ \ defer mu.Unlock()

      \ \ \ \ data++

      }()
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|sync.Mutex>
  </cell>|<\cell>
    A mutex type that supports the <verbatim|.Lock()>, <verbatim|.TryLock()>,
    and <verbatim|.Unlock()> methods. These methods declare exclusive access
    to the shared resource that the mutex represents. By convention, a mutex
    unlock statement is in a <verbatim|defer> statement to avoid
    <verbatim|panic>ing meaning that the mutex is not unlocked.
  </cell>>|<row|<\cell>
    <verbatim|sync.RWMutex>
  </cell>|<\cell>
    This form of mutex requires the specification of the type of access
    desired. An arbitrary number of readers are allowed to read the same
    resource granted that there are no writers. In exchange for the greater
    control over the memory (and potentially less opportunity for
    starvation), it gives lower performance than <verbatim|sync.Mutex> for a
    small number of readers. When the number of readers is high, though, it's
    performance is noticeable. The supported methods are those from
    <verbatim|sync.Mutex>, and the additional <verbatim|.RLock()>,
    <verbatim|.TryRLock()>, <verbatim|.RUnlock()>, and <verbatim|.RLocker()>.
  </cell>>|<row|<\cell>
    <verbatim|sync.Cond>
  </cell>|<\cell>
    A <verbatim|sync.Cond> is a \Prendezvous point\Q for goroutines waiting
    for an event (an signal between two or more goroutines that carries no
    information). The instantiation of a <verbatim|Cond> is done with
    <verbatim|sync.NewCond> which takes a <verbatim|sync.Locker> interface
    (accessible with <verbatim|.L>). Additionally, the methods
    <verbatim|.Broadcast()>, <verbatim|.Signal()>, and <verbatim|.Wait()> are
    available to be used. Consider the following function from the textbook
    that \Psubscribes\Q a function to a <verbatim|Cond>, running the function
    once when the <verbatim|Cond> first broadcasts.

    <\verbatim-code>
      subscribe := func(c *sync.Cond, f func()) {

      \ \ \ \ var goroutineRunning sync.Waitgroup

      \ \ \ \ goroutineRunning.Add(1)

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ goroutineRunning.Done()

      \ \ \ \ \ \ \ \ c.L.Lock()

      \ \ \ \ \ \ \ \ defer c.L.Unlock()

      \ \ \ \ \ \ \ \ c.Wait()

      \ \ \ \ \ \ \ \ f()

      \ \ \ \ }()

      \ \ \ \ goroutineRunning.Wait()

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|sync.Once>
  </cell>|<\cell>
    A variable, <verbatim|once>, of type <verbatim|sync.Once> will support
    the <verbatim|.Do(func())> method which will only execute the passed
    function once regardless of which goroutine the <verbatim|Do> method is
    called, and even what the passed function is to <verbatim|Do>.
  </cell>>|<row|<\cell>
    <verbatim|sync.Pool>
  </cell>|<\cell>
    <verbatim|sync.Pool> is an implementation of an object pool. It can be
    instantiated by specifying the <verbatim|New> field which is a thread
    safe member variable function that creates a new object in the pool. the
    <verbatim|Pool> also supports the methods <verbatim|.Get()>, and
    <verbatim|.Put(object)>. Make no assumptions about the state of the
    instance you get back from <verbatim|.Get()>, but objects in the
    <verbatim|Pool> should be roughly uniform in makeup.\ 
  </cell>>|<row|<\cell>
    Channels
  </cell>|<\cell>
    Channels that are read-write, read-only, and write-only that carry values
    of type <verbatim|T> have types <verbatim|chan T>,
    <verbatim|\<less\>-chan T>, and <verbatim|chan\<less\>- T> respectively.
    A channel can be closed if it is writable, and is done so with
    <verbatim|close()>. To read all the values in the channel until it is
    closed, use <verbatim|range>. Additionally, buffer size of the channel
    can be specified during initiation, and the default buffer size is 0.
    Reading from a channel instantiated with a buffer of capacity 4 can look
    as follows.\ 

    <\verbatim-code>
      channelOwner := func() \<less\>-chan int {

      \ \ \ \ intStream := make(chan int, 4)

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(intStream)

      \ \ \ \ \ \ \ \ for i := 0; i \<less\> 10; i++ { intStream \<less\>- i
      }

      \ \ \ \ }()

      \ \ \ \ return intStream

      }

      \;

      readIntStream := channelOwner()

      for element := range readIntStream {

      \ \ \ \ fmt.Println(element)

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|make()> vs. <verbatim|new()>
  </cell>|<\cell>
    <verbatim|make()> creates slices, maps, and channels by taking in a type
    <verbatim|T> followed by a list of expressions and returns a value of
    type <verbatim|T>. On the other hand, <verbatim|new()> simply returns a
    pointer (type <verbatim|*T>) to allocated memory that is initialized with
    <verbatim|0>s.
  </cell>>|<row|<\cell>
    Type Assertions
  </cell>|<\cell>
    Type assertions \Preveal the concrete value\Q in an interface variable.
    If the assertion is false, and that case isn't handled, panic occurs. See
    the following example of the syntax of type assertion.

    <\verbatim-code>
      var i interface{} = 1

      v, ok := i.(int)

      if ok == false {

      \ \ \ \ fmt.Println("Incorrect type")

      } else {

      \ \ \ \ fmt.Println(v)

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|select>
  </cell>|<\cell>
    The select statement is able to bind channels together. Namely, all
    <verbatim|case> statements are simultaneously checked to see if they are
    ready (for reading this is a populated or closed channel, and for writing
    this is a channel not at capacity). If there is no <verbatim|defualt>,
    then the execution is blocked until one of the channels is ready. One of
    the cases is then chosen at random, and the associated statements run. If
    there is a <verbatim|default>, then the execution isn't blocked. This can
    be used to complete other tasks while waiting for a result.\ 
  </cell>>|<row|<\cell>
    <verbatim|runtime.GOMAXPROCS()>
  </cell>|<\cell>
    Takes an integer parameter that specifies the number of OS threads that
    will host \Pwork queues\Q.\ 
  </cell>>|<row|<\cell>
    <verbatim|runtime.NumCPU()>
  </cell>|<\cell>
    Returns the number of logical CPUs that can be used by the current
    process.
  </cell>>|<row|<\cell>
    <verbatim|iota>
  </cell>|<\cell>
    This keyword is used in conjunction with the <verbatim|constant> keyword.
    It represents an non-negative integer starting from 0. It resets its
    value back to 0 after every <verbatim|constant>, and can be used to
    define enums as such. For example, the following will create an enum
    type, <verbatim|Size>, where <verbatim|xs> is <verbatim|-2>, and
    <verbatim|xl> is <verbatim|2>, and there is no <verbatim|Size> value
    <verbatim|m>.

    <\verbatim-code>
      type Size int

      const (

      \ \ \ \ xs = Size(iota - 2)

      \ \ \ \ s

      \ \ \ \ _

      \ \ \ \ l

      \ \ \ \ xl

      }
    </verbatim-code>
  </cell>>>>>

  <page-break*><section|Concurrency Patterns in Golang>

  <\padded-center>
    <tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
    cyan>|<cwith|1|1|2|2|cell-background|pastel
    green>|<cwith|1|1|3|3|cell-background|pastel
    yellow>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|1|1|1|-1|cell-lborder|1ln>|<cwith|1|1|1|-1|cell-rborder|1ln>|<table|<row|<cell|Concurrency
    Pattern>|<cell|Definition>|<cell|Note>>>>>
  </padded-center>

  <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|-1|cell-halign|l>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-background|pastel
  green>|<cwith|1|1|1|1|cell-background|pastel
  yellow>|<cwith|3|3|1|1|cell-background|pastel
  yellow>|<cwith|4|4|1|1|cell-background|pastel
  cyan>|<cwith|5|5|1|1|cell-background|pastel
  yellow>|<cwith|7|7|1|1|cell-background|pastel
  cyan>|<cwith|8|8|1|1|cell-background|pastel
  cyan>|<cwith|9|9|1|1|cell-background|pastel
  yellow>|<cwith|2|2|1|1|cell-background|pastel
  green>|<cwith|11|11|1|1|cell-background|pastel
  yellow>|<cwith|12|12|1|1|cell-background|pastel
  cyan>|<cwith|13|13|1|1|cell-background|pastel
  cyan>|<cwith|14|14|1|1|cell-background|pastel
  cyan>|<cwith|15|15|1|1|cell-background|pastel
  yellow>|<cwith|16|16|1|1|cell-background|pastel
  cyan>|<cwith|17|17|1|1|cell-background|pastel
  green>|<cwith|18|18|1|1|cell-background|pastel
  cyan>|<cwith|19|19|1|1|cell-background|pastel
  cyan>|<cwith|20|20|1|1|cell-background|pastel
  cyan>|<cwith|21|21|1|1|cell-background|pastel
  cyan>|<cwith|6|6|1|1|cell-background|pastel
  yellow>|<cwith|22|22|1|1|cell-background|pastel
  cyan>|<cwith|25|25|1|1|cell-background|pastel
  yellow>|<cwith|24|24|1|1|cell-background|pastel
  green>|<cwith|23|23|1|2|cell-hyphen|t>|<cwith|23|23|1|2|cell-halign|l>|<cwith|23|23|1|2|cell-lsep|1ex>|<cwith|23|23|1|2|cell-rsep|1ex>|<cwith|23|23|1|2|cell-bsep|1ex>|<cwith|23|23|1|2|cell-tsep|1ex>|<cwith|23|23|1|1|cell-background|pastel
  green>|<cwith|23|23|1|1|cell-background|pastel
  cyan>|<cwith|28|28|1|1|cell-background|pastel
  green>|<cwith|29|29|1|1|cell-background|pastel
  cyan>|<cwith|30|30|1|1|cell-background|pastel
  yellow>|<cwith|31|31|1|1|cell-background|pastel
  yellow>|<cwith|1|-1|1|1|cell-width|25ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<twith|table-hyphen|y>|<cwith|8|8|1|1|cell-hyphen|t>|<cwith|8|8|1|1|cell-halign|l>|<cwith|8|8|1|1|cell-lsep|1ex>|<cwith|8|8|1|1|cell-rsep|1ex>|<cwith|8|8|1|1|cell-bsep|1ex>|<cwith|8|8|1|1|cell-tsep|1ex>|<cwith|8|8|1|1|cell-background|pastel
  green>|<cwith|8|8|1|1|cell-background|pastel
  yellow>|<cwith|8|8|1|1|cell-width|25ex>|<cwith|8|8|1|1|cell-hmode|exact>|<cwith|8|8|1|1|cell-tborder|1ln>|<cwith|8|8|1|1|cell-bborder|1ln>|<cwith|8|8|1|1|cell-lborder|0ln>|<cwith|8|8|1|1|cell-rborder|0ln>|<table|<row|<\cell>
    Safe Operations
  </cell>|<\cell>
    There are a couple different safe operations in concurrent programs,
    including synchronization primitives for memory sharing, synchronization
    with communicating, immutable data, and data produced by confinement.
  </cell>>|<row|<\cell>
    Confinement
  </cell>|<\cell>
    Confinement is when it is ensured that data is only accessed by a single
    concurrent process. There are two types of confinement: ad hoc and
    lexical.

    <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-background|pastel
    green>|<twith|table-hyphen|n>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<\cell>
      Ad Hoc
    </cell>|<\cell>
      This is confinement that adheres to a convention set, but is
      problematic to enforce convention when working on large projects.
    </cell>>|<row|<\cell>
      Lexical
    </cell>|<\cell>
      This form of confinement uses the compiler to enforce confinement, by
      limiting the scope of data and concurrency primitives. This is useful
      for data structures that are not concurrent-safe such as
      <verbatim|bytes.Buffer> as we can see in the example below from the
      text.

      <\verbatim-code>
        printData := func (wg *sync.WaitGroup, data []byte) {

        \ \ \ \ defer wg.Done()

        \;

        \ \ \ \ var buff bytes.Buffer

        \ \ \ \ for _, b := range data {

        \ \ \ \ \ \ \ \ fmt.Printf(&buff, "&c", b)

        \ \ \ \ }

        \ \ \ \ fmt.Println(buff.String())

        }
      </verbatim-code>
    </cell>>>>>
  </cell>>|<row|<\cell>
    When to use Confinement?
  </cell>|<\cell>
    Confinement can mean code that is easier to write and keep track of, and
    smaller critical sections, but the techniques to implement confinement
    are more involved that using synchronization built-ins.
  </cell>>|<row|<\cell>
    <verbatim|for>-<verbatim|select> Loop
  </cell>|<\cell>
    The pattern of sitting a <verbatim|select> in a <verbatim|for> as below
    is common. The example shows an infinite loop, but a range could be used.

    <\verbatim-code>
      for {

      \ \ \ \ select {

      \ \ \ \ // useful work with channels

      \ \ \ \ }

      }
    </verbatim-code>

    This pattern can be used to send an iteration variable on a channel or to
    loop infinitely until stopped. See the example below modified from the
    textbook which demonstrates using a select statement to complete work
    while waiting.

    <\verbatim-code>
      done := make(chan interface{})

      go func() {

      \ \ \ \ defer close(done)

      \ \ \ \ time.Sleep(5 * time.Second)

      }()

      loop:

      for {

      \ \ \ \ select {

      \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ break loop

      \ \ \ \ default:

      \ \ \ \ \ \ \ \ workCounter++

      \ \ \ \ \ \ \ \ time.Sleep(time.Second)

      \ \ \ \ }

      }

      fmt.Println(workCounter)
    </verbatim-code>
  </cell>>|<row|<\cell>
    Goroutine Paths to Termination
  </cell>|<\cell>
    There are 3 paths for a goroutine to terminate. These are

    <\enumerate>
      <item>When the goroutine has completed its work

      <item>When it cannot continue its work due to an unrecoverable error

      <item>When it is told to stop working
    </enumerate>

    The third option is one which allows programs that could possibly cause
    deadlock or take up unnecessary memory to be killed, and is the basis of
    the <verbatim|done> channel concurrency pattern.\ 
  </cell>>|<row|<\cell>
    Goroutine Ownership
  </cell>|<\cell>
    As a good rule of thumb, the goroutine responsible for writing to a
    channel and creating the channel is the one responsible for the lifetime
    of the channel and stopping it.
  </cell>>|<row|<\cell>
    <verbatim|done> Channel
  </cell>|<\cell>
    This can be used to convey to a goroutine that it should stop execution.
    In the following example, the goroutine created is signaled to stop
    executing by passing a channel which will signal to stop either trying to
    read or write to another channel.

    <\verbatim-code>
      printStrings := func(done \<less\>-chan interface{}, strings
      \<less\>-chan string) \<less\>-chan interface{} {

      \ \ \ \ ret := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case s := \<less\>-strings:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ fmt.Println(s)

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }

      \;

      done := make(chan interface{})

      terminated := printStrings(done, nil)

      \;

      go func() {

      \ \ \ \ time.Sleep(time.Second)

      }()

      \<less\>-terminated
    </verbatim-code>
  </cell>>|<row|<\cell>
    Safe Operations
  </cell>|<\cell>
    Suppose you have to compose multiple channels into one: a channel that
    closes when any of the passed channels are closed or written to. While
    you could simply have a different <verbatim|case> in the
    <verbatim|for-select> loop for each <verbatim|done> channel, you could
    alternatively combine the channels with the <verbatim|or> channel
    pattern. Here's the composition function below, taken from the textbook.

    <\verbatim-code>
      var or func(chans <text-dots>\<less\>-chan interface{}) \<less\>-chan
      interface{}

      or = func(chans \<less\>-chan interface{}) \<less\>- chan interface{} {

      \ \ \ \ switch len(chans) {

      \ \ \ \ case 0:

      \ \ \ \ \ \ \ \ return nil

      \ \ \ \ case 1:

      \ \ \ \ \ \ \ \ return chans[0]

      \ \ \ \ }

      \;

      \ \ \ \ orDone := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(orDone)

      \ \ \ \ \ \ \ \ switch len(chans) {

      \ \ \ \ \ \ \ \ case 2:

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-chans[0]:

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-chans[1]:

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ default:

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-chans[0]:

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-chans[1]:

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-chans[2]:

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-or(append(chans[3:],
      orDone)<text-dots>):

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return orDone

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    Handling Errors
  </cell>|<\cell>
    Consider encapsulating errors in a struct to handle them better upstream.
    For example,

    <\verbatim-code>
      type Result struct {

      \ \ \ \ Error error

      \ \ \ \ Value interface{}

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    Pipelines and Pipeline stages
  </cell>|<\cell>
    A pipeline is a series of <with|font-shape|italic|stages> which take data
    in, perform an operation, and pass the data out. Stages are connected by
    passing of data. The stage must consume and return the same type, and
    stages must be reified by the language so they can be passed around (like
    functions). Stages can be either batch processing (where whole batches of
    data are operated on at once) or stream processing (where stages only
    operate on single elements at a time).
  </cell>>|<row|<\cell>
    Making a pipeline
  </cell>|<\cell>
    It is advised to make a stream pipeline when possible in Go. This is done
    by making each stage a goroutine and returning and passing channels. Each
    stage <verbatim|range>s over the passed channel. Additionally, a
    generator function is required to pass input into the pipeline. The
    <verbatim|done> channel pattern should be used to ensure the cleanup of
    all goroutines, and will be passed into all stages of the pipeline as
    well.

    Two parts of a pipeline stage must be preemptable: the creation of the
    discrete value and sending the discrete value on the channel.
  </cell>>|<row|<\cell>
    <verbatim|repeat> Generator
  </cell>|<\cell>
    The repeat generator outputs a stream which repeats the set of discrete
    values passed. See the following code modified from the textbook.

    <\verbatim-code>
      repeat := func(done \<less\>-chan interface{}, vals
      <text-dots>interface{}) \<less\>-chan interface{} {

      \ \ \ \ ret := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for {

      \ \ \ \ \ \ \ \ \ \ \ \ for _, val := range vals {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case ret \<less\>- val:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|take> Stage
  </cell>|<\cell>
    The take stage only takes the first <verbatim|num> elements of the
    channel passed in. The following is modified code from the textbook.

    <\verbatim-code>
      take := func(done \<less\>-chan interface{}, values \<less\>-chan
      interface{}, num int) \<less\>-chan interface{} {

      \ \ \ \ ret := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for i := 0; i \<less\> num; i++ {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ case ret \<less\>- \<less\>-values:

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|repeatFn> Generator
  </cell>|<\cell>
    Exactly like the <verbatim|repeat> generator, but with a signature of:

    <verbatim|func(done \<less\>-chan interface{}, fn func() interface{})
    \<less\>-chan interface{}>\ 

    Additionally, rather than a loop over the values of <verbatim|vals>, a
    simple <verbatim|select> can be used with one case as <verbatim|case ret
    \<less\>- fn():>.
  </cell>>|<row|<\cell>
    Empty Interfaces in Pipelines
  </cell>|<\cell>
    Using empty interfaces allows the library of stages and generators used
    in a pipeline to be common between different pipelines and at any stage
    of a pipeline, type assertion can be used.
  </cell>>|<row|<\cell>
    Type Assertion Stage
  </cell>|<\cell>
    This stage has the following type signature (for some type <verbatim|T>):

    <verbatim|func(done \<less\>-chan interface{}, vals \<less\>-chan
    interface{}) \<less\>-chan T>\ 

    This stage applies type assertion to everything passed in the pipeline.
    It is similar to the <verbatim|take> stage, but rather it iterates over
    the range of the whole channel, and performs a type assertion.
  </cell>>|<row|<\cell>
    Fan-Out Fan-In
  </cell>|<\cell>
    When one stage of the pipeline is slowing down the entire pipeline, you
    can consider using more than one goroutine to do the operations of that
    stage in parallel, so that more than one datum is being processed in that
    stage at a time.

    <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-background|pastel
    green>|<twith|table-hyphen|n>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<\cell>
      Fan-Out
    </cell>|<\cell>
      The act of splitting the input of the pipeline into multiple
      goroutines.
    </cell>>|<row|<\cell>
      Fan-In
    </cell>|<\cell>
      The act of joining multiple results or multiplexing back into one
      channel for the pipeline.
    </cell>>>>>

    The pattern is applicable when the operation of the stage doesn't care
    about computation history (including order).
  </cell>>|<row|<\cell>
    Fan-Out
  </cell>|<\cell>
    One can create an array of stage goroutines as such

    <\verbatim-code>
      numRoutines := runtime.NumCPU()

      routines := make([]\<less\>-chan interface{}, numRoutines)

      for i := 0; i \<less\> numRoutines; i++ {

      \ \ \ \ routines[i] = stage(done, inStream)

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    Fan-In or Multiplexing
  </cell>|<\cell>
    The following multiplexing code example is modified from the text and
    requires that the order of output does not matter.

    <\verbatim-code>
      fanIn := func(done \<less\>-chan interface{}, chans
      <text-dots>\<less\>-chan interface{}) \<less\>-chan interface{} {

      \ \ \ \ var wg sync.WaitGroup

      \ \ \ \ multiplexedStream := make(chan interface{})

      \ \ \ \ multiplex := func(c \<less\>-chan interface{}) {

      \ \ \ \ \ \ \ \ defer wg.Done()

      \ \ \ \ \ \ \ \ for i := range c {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ case multiplexedStream \<less\>- i:

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }

      \ \ \ \ wg.Add(len(chans))

      \ \ \ \ for _, c := range chans {

      \ \ \ \ \ \ \ \ go multiplex(c)

      \ \ \ \ }

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ wg.Wait()

      \ \ \ \ \ \ \ \ close(multiplexedStream)

      \ \ \ \ }()

      \ \ \ \ return multiplexedStream

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|or-done> Channel
  </cell>|<\cell>
    We seem to be using a certain pattern of wrapping our reads from a
    channel with a <verbatim|select> so that we can safely close our
    goroutines with a <verbatim|done>. We can abstract this, as follows:

    <\verbatim-code>
      orDone := func(done, c \<less\>-chan interface{}) \<less\>-chan
      interface{} {

      \ \ \ \ ret := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for e := range c {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ case ret \<less\>- e:

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>

    But if the channel <verbatim|c> doesn't close, and <verbatim|done> is
    closed, we could have our <verbatim|for> waiting unnecessarily on the
    next element of <verbatim|c>, thus stalling. Thus, we prefer the
    following code:

    <\verbatim-code>
      orDone := func(done, c \<less\>-chan interface{}) \<less\>-chan
      interface{} {

      \ \ \ \ ret := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return

      \ \ \ \ \ \ \ \ \ \ \ \ case v, ok := \<less\>-c:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case valStream \<less\>- v:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>

    This abstraction allows us to use simpler loops.
  </cell>>|<row|<\cell>
    <verbatim|tee> Channel
  </cell>|<\cell>
    This channel splits the incoming stream into two identical streams. This
    code is from the textbook.

    <\verbatim-code>
      tee := func(done, in \<less\>-chan interface{}) (\<less\>-chan
      interface{}, \<less\>-chan interface{}) {

      \ \ \ \ out1 := make(chan interface{})

      \ \ \ \ out2 := make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(out1)

      \ \ \ \ \ \ \ \ defer close(out2)

      \ \ \ \ \ \ \ \ for val := range orDone(done, in) {

      \ \ \ \ \ \ \ \ \ \ \ \ var out1, out2 = out1, out2 // shadowing

      \ \ \ \ \ \ \ \ \ \ \ \ for i := 0; i \<less\> 2; i++ {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case out1 \<less\>- val:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ out1 = nil

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case out2 \<less\>- val:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ out2 = nil

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return out1, out2

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|bridge> Channel
  </cell>|<\cell>
    This channel flattens a channel of channels into a channel.

    <\verbatim-code>
      bridge := func(done \<less\>-chan interface{}, chans \<less\>-chan
      \<less\>-chan interface{}) \<less\>-chan interface{} {

      \ \ \ \ ret = make(chan interface{})

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for chan := range orDone(done, chans) {

      \ \ \ \ \ \ \ \ \ \ \ \ for elem := range orDone(done, chan) {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ case ret \<less\>- elem:

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ \ \ \ \ }

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    <verbatim|buffer> Stage
  </cell>|<\cell>
    Creates a buffer of the given size.

    <\verbatim-code>
      buffer := func(done \<less\>-chan interface{}, in \<less\>-chan
      interface{}, bufferSize int) \<less\>-chan interface{} {

      \ \ \ \ ret = make(chan interface{}, bufferSize)

      \ \ \ \ go func() {

      \ \ \ \ \ \ \ \ defer close(ret)

      \ \ \ \ \ \ \ \ for val := range orDone(done, in) {

      \ \ \ \ \ \ \ \ \ \ \ \ select {

      \ \ \ \ \ \ \ \ \ \ \ \ case \<less\>-done:

      \ \ \ \ \ \ \ \ \ \ \ \ case ret \<less\>- val:

      \ \ \ \ \ \ \ \ }

      \ \ \ \ }()

      \ \ \ \ return ret

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    Queuing
  </cell>|<\cell>
    Queuing is the acceptance of work into the pipeline despite the fact that
    the pipeline is not ready for more. This is usually implemented with
    buffered channels.
  </cell>>|<row|<\cell>
    Runtime Performance and Uses of Queuing
  </cell>|<\cell>
    Despite accepting more work, the amount of work that must be ultimately
    completed is the same, and the speed of the CPU is the same. The runtime
    performance is not different with queuing, thus. Instead, queuing is used
    so that the amount of time a goroutine (specifically a stage of the
    pipeline) is spent blocking is reduced. Queuing, in some sense,
    <with|font-shape|italic|decouples> certain stages of the pipeline a
    reasonable amount. The book states that queuing should be used in the
    following situations:

    <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-hyphen|n>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-background|pastel
    yellow>|<cwith|2|2|1|1|cell-background|pastel
    green>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<\cell>
      Batching requests in a stage saves time
    </cell>|<\cell>
      An example of this is the chunking of requests to a file, which is why
      the <verbatim|bufio> package exists. Additionally, this is useful for
      database transactions, calculating checksums, and allocating contiguous
      space.\ 
    </cell>>|<row|<\cell>
      Negative Feedback Loop
    </cell>|<\cell>
      A negative feedback loop, also called a downward-spiral or
      death-spiral, is when if there is a delay in a stage of the pipeline,
      there is more input for the pipeline. Since the time the pipeline takes
      to clear the input is related to the amount of input, this causes a
      downward spiral. For example, consider servers which bounce requests
      instead of storing requests in a queue and processing them one by one.
    </cell>>>>>

    As such, only implement queuing at the entrance to the pipeline (negative
    feedback loop) or at stages where batching is more efficient.
  </cell>>|<row|<\cell>
    Stable Systems, Ingress, and Egress
  </cell>|<\cell>
    Ingress is the rate at which work enters the system, and egress is the
    rate at which it exits the system. Stable systems are those in which the
    egress is equal to the ingress. The two unstable systems are when the
    ingress is more than the egress (which is a death spiral) and when it is
    less than the egress.\ 
  </cell>>|<row|<\cell>
    Little's Law
  </cell>|<\cell>
    Little's Law requires sufficient sampling and determines the throughput
    of a pipeline. This is only applicable in stable systems.

    <\equation*>
      L=\<lambda\>W
    </equation*>

    <tabular|<tformat|<cwith|1|-1|2|2|cell-hyphen|t>|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|1|cell-background|pastel
    green>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<table|<row|<cell|<math|L>>|<\cell>
      the average number of units in the pipeline
    </cell>>|<row|<cell|<math|\<lambda\>>>|<\cell>
      the average arrival rate of units
    </cell>>|<row|<cell|<math|W>>|<\cell>
      the average time a unit spends in the pipeline
    </cell>>>>>
  </cell>>|<row|<\cell>
    Persistent Queues
  </cell>|<\cell>
    If a pipeline panics with a queue in it, all requests stored in the queue
    are lost. Thus, one may want to avoid using a queue in this case, but if
    this is not possible, a persistent queue is used which is persisted and
    can be read later.
  </cell>>|<row|<\cell>
    <verbatim|context>
  </cell>|<\cell>
    From the package <verbatim|context>, <verbatim|context.Context> is a data
    type that carries deadlines, timeouts, cancellation signals, and
    \Prequest-scoped\Q values between processes and across API borders. An
    empty context can be created with <verbatim|Background()> and
    <verbatim|contexts> cannot be mutated so that any passed contexts will
    not be changed by the processes they were passed to. Instead, the child
    process can create its own <verbatim|context> with the methods
    <verbatim|WithCancel>, <verbatim|WithTimeout>, and
    <verbatim|WithDeadline>. More information at
    <slink|https://pkg.go.dev/context>.
  </cell>>|<row|<\cell>
    <verbatim|context> values
  </cell>|<\cell>
    Each <verbatim|context> also carries values with it in key-value pairs.
    New contexts with different values can be created with
    <verbatim|.WithValue(parent Context, key val any)>. Values can be
    accessed from a context with <verbatim|.Value>. Since the key and value
    are <verbatim|interface{}> and can accept any type, there is a loss of
    type safety, which is why it is recommended to have data-hiding.\ 
  </cell>>|<row|<\cell>
    When to use <verbatim|context> values?
  </cell>|<\cell>
    It is recommended to only use context values for request-scoped data, and
    not as optional parameters to functions. The textbook provides some
    heuristics on what can be considered \Prequest-scoped data\Q.

    <\enumerate>
      <item>Crosses processes or APIs

      <item>Immutable

      <item>Simple types

      <item>Is not types with methods, but rather just data

      <item>Doesn't \Pdrive\Q operations
    </enumerate>
  </cell>>>>>

  <page-break*><section|Concurrency at Scale>

  <\padded-center>
    <tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
    green>|<cwith|1|1|2|2|cell-background|pastel
    yellow>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|1|1|1|-1|cell-lborder|1ln>|<cwith|1|1|1|-1|cell-rborder|1ln>|<table|<row|<cell|Definition>|<cell|Note>>>>>
  </padded-center>

  <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|-1|cell-halign|l>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-background|pastel
  green>|<cwith|1|-1|1|1|cell-width|25ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|2|2|1|1|cell-background|pastel
  yellow>|<cwith|3|3|1|1|cell-background|pastel
  yellow>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<cwith|1|1|1|1|cell-background|pastel
  green>|<twith|table-hyphen|y>|<cwith|4|4|1|1|cell-background|pastel
  yellow>|<cwith|5|5|1|1|cell-background|pastel
  yellow>|<cwith|6|6|1|1|cell-background|pastel yellow>|<table|<row|<\cell>
    Errors
  </cell>|<\cell>
    Errors are first-class citizens in Go, and they represent when your
    program cannot fulfill the requested instructions. There are two main
    types of errors that can come up in your program: bugs, and known edge
    cases. It is important to convey lots of information in known edge cases.
    In Go, <verbatim|error> is an interface with one method:
    <verbatim|Error()> which returns a <verbatim|string>.
  </cell>>|<row|<\cell>
    What should errors convey?
  </cell>|<\cell>
    Errors should convey the following important information:

    <\enumerate-numeric>
      <item>What caused the error

      <item>When and where the error happened

      <item>A \Pfriendly user-facing message\Q

      <item>Resources for getting more information
    </enumerate-numeric>

    Providing this information differentiates the known edge cases from the
    bugs in the program. Consider the following struct which implements
    <verbatim|error>.

    <\verbatim-code>
      type WrappedError struct {

      \ \ \ \ Inner \ \ \ \ \ error

      \ \ \ \ Message \ \ \ string

      \ \ \ \ StackTrace string

      \ \ \ \ Misc \ \ \ \ \ \ map[string]interface{}

      }

      \;

      func wrapError (err error, msgf string, msgArgs <text-dots>interface{})
      WrappedError {

      \ \ \ \ return WrappedError {

      \ \ \ \ \ \ \ \ Inner: \ \ \ \ \ err,

      \ \ \ \ \ \ \ \ Message: \ \ \ fmt.Sprintf(msgf, msgArgs<text-dots>),

      \ \ \ \ \ \ \ \ StackTrace: string(debug.Stack()),

      \ \ \ \ \ \ \ \ Misc: \ \ \ \ \ \ make(map[string]interface{}),

      \ \ \ \ }

      }

      \;

      func (err WrappedError) Error() string {

      \ \ \ \ return err.Message

      }
    </verbatim-code>
  </cell>>|<row|<\cell>
    How to handle errors between modules
  </cell>|<\cell>
    It is suggested for errors to have a special type for each module, and
    any error which is not of the module's error type is malformed, or a bug.
    This means that if a module calls another, it should wrap the potential
    error in its own error type, while potentially adding more information.
  </cell>>|<row|<\cell>
    Why should processes support timeouts?
  </cell>|<\cell>
    There are many responses to a timeout, but why should processes timeout
    in the first place? Timeouts can:

    <\enumerate-numeric>
      <item>Reduce the amount of pipeline saturation (if the request won't be
      repeated if timed out and there's not enough resources to store it)

      <item>Avoid stale data (data which is no longer relevant after a
      certain amount of time)

      <item>Avoid deadlocks (at the expense of potentially turning the
      deadlock into a livelock)
    </enumerate-numeric>
  </cell>>|<row|<\cell>
    Why are processes canceled?
  </cell>|<\cell>
    The outlined reasons for cancellation include:

    <\enumerate-numeric>
      <item>Timeouts

      <item>User intervention

      <item>Parent cancellation

      <item>Replicated requests
    </enumerate-numeric>
  </cell>>|<row|<\cell>
    Cancellation based Design
  </cell>|<\cell>
    Cancellation can occur any time during the execution of a process, and it
    is important to be able to elegantly stop the process. Here are the
    biggest issues and what to keep in mind:

    <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|-1|1|-1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-halign|l>|<twith|table-hyphen|n>|<cwith|1|-1|1|-1|cell-lsep|1ex>|<cwith|1|-1|1|-1|cell-rsep|1ex>|<cwith|1|-1|1|-1|cell-bsep|1ex>|<cwith|1|-1|1|-1|cell-tsep|1ex>|<cwith|1|-1|1|1|cell-width|15ex>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<cwith|1|-1|1|1|cell-background|pastel
    yellow>|<table|<row|<\cell>
      Size of Atomic Operations
    </cell>|<\cell>
      It may be that one of the non-preemptable operations in a particular
      algorithm takes a particularly long amount of time. In this time, what
      if the process was canceled? Split large processes which are
      non-preemptable into smaller non-preemptable, atomic operations that
      take less time to execute.
    </cell>>|<row|<\cell>
      Modifying Global State
    </cell>|<\cell>
      What if a goroutine happens to modify a global state, and was partly
      done doing so until the routine was canceled. Rolling back the changes
      made may be very tough. Try to keep the number of changes done to a
      minimum, perhaps keep track of what changes are to be made, and then
      make all the changes at the end of the routine.
    </cell>>|<row|<\cell>
      Duplicate Messages
    </cell>|<\cell>
      Suppose we delegate a task to a process <verbatim|A1>, which is taking
      a long time to complete. We then realize that <verbatim|A1> has not
      read from the channel leading into it for a while, so we cancel it and
      send the same request to process <verbatim|A2> to handle. In the time
      we send the cancel signal, <verbatim|A1> could have already sent the
      result to the next process, which then receives 2 identical messages
      (from <verbatim|A1> and <verbatim|A2>). How do we address this? Here
      are some recommendations:

      <\enumerate-numeric>
        <item>Use heartbeats

        <item>Have the recipient process accept either the first or last
        result reported

        <item>Poll the parent goroutine for permission to send the message to
        the next process before sending it
      </enumerate-numeric>
    </cell>>>>>
  </cell>>|<row|<\cell>
    Heartbeats
  </cell>|<\cell>
    Generally, out of the 3 mentioned methods to avoid issues with duplicate
    messages, using what are called heartbeats is the most straightforward.
    Heartbeats are just a way for goroutines to let others know that they are
    still alive, which is to say that they have not experienced any sort of
    deadlock and are getting work done. The two type of heartbeats are those
    that beat based on a time interval, and those that beat at the start of a
    unit of work.
  </cell>>>>>

  \;
</body>

<\initial>
  <\collection>
    <associate|info-flag|none>
    <associate|page-breaking|professional>
    <associate|page-medium|automatic>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-2|<tuple|2|6>>
    <associate|auto-3|<tuple|3|11>>
    <associate|auto-4|<tuple|4|22>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Basic
      Concurrency Ideas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Golang
      Features and Building Blocks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Concurrency
      Patterns in Golang> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Concurrency
      at Scale> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>