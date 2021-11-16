// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface X<T>{}

interface Y<T>{}

class Z <: X<Int32> & Y<Int32>{}

func test<T>() where T <: X<T>, T <: Y<T>{}

record R<T> where T <: X<T>, T <: Y<T>{}

enum E<T> where T <: X<T>, T <: Y<T>{e}

class C<T> where T <: X<T>, T <: Y<T>{}

interface I<T> where T <: X<T>, T <: Y<T>{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X<T>, T <: Y<T>{ func bar(a:R2<T>){} }

func main():Int64{
test<Z>() // EXPECTED: regex no matching function declaration for function call
R<Z>() // EXPECTED: regex generics type arguments do not match the constraint
bar(R2<Z>()) // EXPECTED: regex no matching function declaration for function call
E<Z>.e // EXPECTED: regex generics type arguments do not match the constraint
C<Z>() // EXPECTED: regex generics type arguments do not match the constraint
func foo(a:I<Z>){} // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
