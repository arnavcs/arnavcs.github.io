#####################################
# Infinite Data and Lazy Evaluation #
#####################################

# Arnav Kumar
# October 13, 2023

'''
Although the system we are running code on only has a finite amount of resources, it is possible to
represent infinite data structures with a finite amount of data.

One example which you are likely familiar with is a pure function. Although a function can be
viewed as performing an operation on a piece of data, pure functions can also be viewed as mapping
a certain set of inputs to given outputs. As such, it holds information.

Now let's consider infinite lists. We want a way to describe what should be in the list rather than
have everything that is in the list be stored in memory. In a sense, we want to be able to promise
the programmer that if they ask for it, we can give them any element they want, but without storing
those elements in memory.

This idea of a promise is something we call a "thunk". An expression that is not evaluated until
needed. This is what lazyness is.

The method for evaluating a Python expression will first evaluate all arguments in a function call
before calling the function, but a lazy evaluation method defers all the evaluation until is it
absolutely needed (like when the user asks to print a value or uses a value in a conditional
statement.

Languages like Haskell are automatically lazy, but in Python, we have to be explicit if we want
lazy behaviour and use a thunk. It is cleverly done with functions. Consider the following: 

a = 2 * 3

b = (lambda : 2 * 3)

in the first case, we have to calculate a when it is defined, but in the second, if it is not
defined, since it is technically a function. If we want to use the value b, we have to call it with
b(). This means that if we want to use the value stored in b more than once, we might be repeating
the computation, but we are only doing the computation when we want to.

So how do we use lambdas to create infinite lists? Well these infinite lists are really streams.
We equip a stream with a current element, and the "rest of the stream" which we need not evaluate.
Also, an empty stream is an empty list in our implementation.

This "promise" means that we can store infinite streams without storing all of the data. 

See the following Python defintions: 
'''

def stream_head(s):
    '''
    s is a stream.
    Returns the first element s and raises an error if s is empty.
    '''
    return s[0]

def stream_tail(s):
    '''
    s is a stream.
    Returns the rest of the stream s (excluding the head) and raises an error if s is empty.
    '''
    return s[1]()

def stream_cons(e, s):
    '''
    e is a value, s is a stream.
    Constructs a stream whose first element is e and remainder is s.
    Warning: this will evaluate s before the function call.
    '''
    return [e, (lambda : s)]

def lazy_stream_cons(e, fs):
    '''
    e is a value, fs is a stream promise.
    Constructs a stream whose first element is e and remainder is fs.
    Since fs is a stream promise, it is not evaluated, unlike in stream_cons.
    '''
    return [e, fs]

def stream_empty(s):
    '''
    s is a stream.
    Returns True if s is empty and False otherwise.
    '''
    return not s

def empty_stream():
    '''
    Returns the empty stream.
    '''
    return []

'''
With these defintions, there is a lot that we can do with streams. Let's explore some basic
generating functions. Generating functions will construct an ADT in a generative or stepwise
manner.
'''

def stream_generate(initial, step, done, final):
    '''
    initial is a value of type a, step is a function a -> a, done is a function a -> Bool, and
    final is a function a -> b where b is another type.
    This function returns a stream whose elements are:
        final(initial), final(step(initial)), final(step(step(initial)), ...
    until done(step(...step(initial)...)) is True.
    '''
    if done(initial):
        return empty_stream()
    return lazy_stream_cons(final(initial),
                            (lambda : stream_generate(step(initial), step, done, final)))

def stream_foldl(fn, i, s):
    '''
    i is a value of type a, s is a stream of elements of type b, fn is a function (a, b) -> a.
    If s is not-finite, this function never terminates.
    If s is s_1, s_2, s_3, ..., s_n then it returns:
        fn(fn(...fn(fn(i, s_1), s_2)..., s_{n-1}), s_n)
    '''
    if stream_empty(s):
        return i
    return stream_foldl(fn, fn(i, stream_head(s)), stream_tail(s))

def stream_concat(ss):
    '''
    ss is a stream of streams.
    Returns a stream which is the concatenation of all streams in ss.
    '''
    if stream_empty(ss):
        return empty_stream()
    if stream_empty(stream_head(ss)):
        return stream_concat(stream_tail(ss))
    return lazy_stream_cons(stream_head(stream_head(ss)),
                            (lambda : stream_concat(stream_cons(stream_tail(stream_head(ss)),
                                                               stream_tail(ss)))))

def stream_map(fn, s):
    '''
    s is a stream of elements of type a, fn is a function a -> b where b is another type.
    Returns a stream where each element e of s is replaced with fn(e).
    '''
    if stream_empty(s):
        return empty_stream()
    return lazy_stream_cons(fn(stream_head(s)), (lambda : stream_map(stream_tail(s))))

def stream_filter(fn, s):
    '''
    s is a stream of elements of type a, fn is a function a -> Bool.
    Returns a stream containing only the elements e of s which satisfy fn(e) is True.
    '''
    if stream_empty(s):
        return empty_stream()
    if fn(stream_head(s)):
        return lazy_stream_cons(stream_head(s), (lambda : stream_filter(fn, stream_tail(s))))
    return stream_filter(fn, stream_tail(s))

def stream_scanl(fn, i, s):
    '''
    i is a value of type a, s is a stream of elements of type b, fn is a function (a, b) -> a.
    Returns a stream where the k+1th stream element is stream_foldl(fn, i, stream_take(k, s)).
    '''
    if stream_empty(s):
        return stream_cons(i, empty_stream())
    return lazy_stream_cons(i, (lambda : stream_scanl(fn, fn(i, stream_head(s)), stream_tail(s))))

def stream_iterate(fn, i):
    '''
    i is a value of type a, fn is a function a -> a.
    Returns the stream:
        i, fn(i), fn(fn(i)), fn(fn(fn(i))), ...
    '''
    return lazy_stream_cons(i, (lambda : iterate(fn, fn(i))))

def stream_cycle(es):
    '''
    es is a list of elements type a.
    Returns a stream which cycles through the elements of es indefinitely.
    '''
    if not es:
        return None
    return stream_generate((es, 0, len(es)),
                           (lambda x : (x[0], (x[1] + 1) % x[2], x[2])),
                           (lambda x : False),
                           (lambda x : x[0][x[1]]))

def stream_repeat(e):
    '''
    e is a value of type a.
    Returns an infinite stream where every element is e.
    '''
    return stream_cycle([e])

def stream_take(n, s):
    '''
    n is a non-negative integer, s is a stream.
    Returns a stream which is (at most) the first n elements of s.
    '''
    if n == 0 or stream_empty(s):
        return empty_stream()
    return lazy_stream_cons(stream_head(s), (lambda : stream_take(n-1, stream_tail(s))))

def stream_drop(n, s):
    '''
    n is a non-negative integer, s is a stream.
    Returns a stream which is s without the (at most) first n elements of s.
    '''
    if n == 0 or stream_empty(s):
        return s
    return stream_drop(n-1, stream_tail(s))

def stream_take_while(fn, s):
    '''
    s is a stream with values of type a, fn is a function a -> Bool.
    Returns a stream which is the consecutive first elements e of s which satisfy fn(e) is True.
    '''
    if stream_empty(s) or not fn(stream_head(s)):
        return empty_stream()
    return lazy_stream_cons(stream_head(s), (lambda : stream_take_while(fn, stream_tail(s))))

def stream_drop_while(fn, s):
    '''
    s is a stream with values of type a, fn is a function a -> Bool.
    Returns s with the consecutive first elements e of s removed which satisfy fn(e) is True.
    If all e in s satisfy fn(e), then this function never terminates.
    '''
    if stream_empty(s) or fn(stream_head(s)):
        return s
    return stream_drop_while(fn, stream_tail(s))

'''
In addition, we might want a quicker way to make certain streams, or perhaps print some out, so we
have simple list to stream and stream to list conversion functions.
'''

def stream_to_list(s):
    '''
    s is a stream.
    Returns a list containing all the elements of s but doesn't terminate if s is not finite.
    '''
    ret = []
    while not stream_empty(s):
        ret.append(stream_head(s))
        s = stream_tail(s)
    return ret

def list_to_stream(es):
    '''
    es is a list.
    Returns a stream of the elements in es.
    '''
    ret = empty_stream()
    for i in range(len(es) - 1, -1, -1):
        ret = stream_cons(es[i], ret)
    return ret

'''
Together, these are some examples of how streams are jsut as powerful as lists, but with the added
benefit that evaluation is lazy.

This style of programming is quite powerful because you can solve problems quite neatly. If you
wish to program in this way in python though, perhaps you would rather use Python's inbuilt
iterator abstraction. Just like this, it doesn't evaluate future values until needed (but is stored
in a slightly different structure) and play much nicer with existing Python syntax. In fact, the
Python range function generates an iterator.

If you are interested in iterators, the itertools module provides functionality similar to what we
have built up.
'''
