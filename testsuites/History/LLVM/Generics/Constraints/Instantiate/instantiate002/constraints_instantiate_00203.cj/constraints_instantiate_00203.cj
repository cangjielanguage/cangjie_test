// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Z<T>{}

class ZZ <: Z<Int64>{}


trait T{func foo(a:This):Unit}

func test<X>(a:X) where X <: Z<X>{}

record R<X> where X <: Z<X>{}

enum E<X> where X <: Z<X>{e}

class C<X> where X <: Z<X>{}

interface I<X> where X <: Z<X>{}

append<X> R<X> with T where X <: Z<X>{func foo(a:R<X>):Unit{}}

func main():Int64{
test<ZZ>(ZZ()) // EXPECTED: regex no matching function declaration for function call
R<ZZ>() // EXPECTED: regex generics type arguments do not match the constraint
E<ZZ>.e // EXPECTED: regex generics type arguments do not match the constraint
C<ZZ>() // EXPECTED: regex generics type arguments do not match the constraint
func foo(input:I<ZZ>){} // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
