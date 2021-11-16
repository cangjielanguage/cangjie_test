// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface X<T>{}

interface Y<T>{}

class Z<T> <: X<T> & Y<T>{}

func test<T>() where T <: X<T>, T <: Y<T>{}

record R<T> where T <: X<T>, T <: Y<T>{}

enum E<T> where T <: X<T>, T <: Y<T>{e}

class C<T> where T <: X<T>, T <: Y<T>{}

interface I<T> where T <: X<T>, T <: Y<T>{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X<T>, T <: Y<T>{ func bar(a:R2<T>){} }

func main():Int64{
test<Z<Unit>>() // EXPECTED: regex no matching function declaration for function call
R<Z<Unit>>() // EXPECTED: regex generics type arguments do not match the constraint
bar(R2<Z<Unit>>()) // EXPECTED: regex no matching function declaration for function call
E<Z<Unit>>.e// EXPECTED: regex generics type arguments do not match the constraint
C<Z<Unit>>()// EXPECTED: regex generics type arguments do not match the constraint
func foo(a:I<Z<Unit>>){}// EXPECTED: regex generics type arguments do not match the constraint
return 0
}
