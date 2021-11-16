// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait T{func foo(a:This):Unit}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(a:X) where X <: T{}

record R<X> where X <: T{}

enum E<X> where X <: T{e}

class C<X> where X <: T{}

interface I<X> where X <: T{}

append<X> R<X> with T where X <: T{func foo(a:R<X>):Unit{}}

func main():Int64{
test<Bool>(true) // EXPECTED: regex no matching function declaration for function call
R<Bool>() // EXPECTED: regex generics type arguments do not match the constraint
E<Bool>.e // EXPECTED: regex generics type arguments do not match the constraint
C<Bool>() // EXPECTED: regex generics type arguments do not match the constraint
func foo(input:I<Bool>){} // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
