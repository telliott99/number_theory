##################
Modular arithmetic
##################

Modular arithmetic (sometimes called "clock" arithmetic) is very important in cryptography.

As Hardy `says <https://projecteuclid.org/download/pdf_1/euclid.bams/1183493592>`_ (section I.3).

    The absolute values of numbers are comparatively unimportant; we want to know what time it is, not how many minutes have passed since the creation.

Further

    Two numbers *a* and *b* are **congruent** to modulus *m* if they leave the same remainder when divided by *m*

Recall that all the numbers we deal with here are integers.  The above statement is equivalent to the following:

.. math::

    a = jm + r \\

    b = km + r

so then

.. math::

    a - b = m(j - k)

We see that :math:`m|(j-k)` and we write 

.. math::

    a := b \ mod \ m \\

or

.. code-block:: python

    a % m = b % m

or sometimes, an equals sign with 3 bars across, where that symbol and :math:`:=` both mean "equal by definition".

Invariably, if we are considering the result for an expression on the left-hand side mod *n*, we also want to evaluate the right-hand side mod *n*.  In that case, we will simply end the paragraph preceeding with the directive (mod *n*).

--------
Addition
--------

We will prove that (mod *n*):

.. math::

   a + b = (a \ mod \ n) + (b \ mod \ n)

We assume that ``a > n`` and ``b > n``, because otherwise the results are trivial.

Suppose that

.. math::

    a \ mod \ n = r_1 \\

    a = jn + r_1

and 

.. math::

    b \ mod \ n = r_2 \\

    b = kn + r_2

We want to evaluate (mod *n*):

.. math::

   a + b = (a \ mod \ n) + (b \ mod \ n)

The left-hand side is:

.. math::

    jn + r_1 + kn + r_2 \\

    = (j + k)n + r_1 + r_2

Evaluated (mod *n*):

.. math::

    = r_1 + r_2

which is equal to the right-hand side, evaluated mod *n*, before the addition operation.

Allow for the possibility that :math:`r_1 + r_2 > n` and we'll need another application of mod *n*.

--------------
Multiplication
--------------

That is also true of multiplication.  Consider:

.. math::

    ab = (a \ mod \ n)(b \ mod \ n)

For *a* and *b* as defined above, the left-hand side is:

.. math::

    ab = (jn + r_1) (kn + r_2) \\

    = jkn^2 + jnr_2 + knr_1 + r_1 r_2

Evaluated (mod *n*)

.. math::

     = r_1 r_2 = (a \ mod \ n)(b \ mod \ n)

Allow for the possibility that :math:`r_1 r_2 > n` and we'll need another application of mod *n*.

The practical result of all this is that we can carry out exponentiation and modulus operations in interleaved fashion.

Namely, to evaluate :math:`m^3`, multiply *m* by itself a total of *e* times, starting with :math:`m \cdot m`.  Whenever the intermediate product exceeds *n*, replace it by the remainder ``% n``.  Repeat as many times as the exponent dictates.

In Python:

.. code-block:: python

    pow(x,y,z)

works this way.

--------
Examples
--------

.. math::

    7 \times 10 \ mod \ 6 = 1 \times 4 = 4

and

.. math::

    2 a \ mod \ p = (2 \ mod \ p) \cdot (a \ mod \ p)

Hence

------------
Cancellation
------------

If :math:`ra = sa` mod *n*, then :math:`r = s` mod *n*.

-----
Proof
-----

.. math::

     ra \ mod \ n = (r \mod n)(a \ mod \ n)

The same is true for *rs*, so the common term cancels.
