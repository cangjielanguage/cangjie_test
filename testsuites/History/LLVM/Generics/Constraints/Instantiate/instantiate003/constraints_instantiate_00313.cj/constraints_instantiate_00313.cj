// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
trait Y{}

open class X<T>{}

append X<Int32> with Y{}

func test<T>() where T <: X<Int32>, T <: Y{}

record R<T> where T <: X<Int32>, T <: Y{}

enum E<T> where T <: X<Int32>, T <: Y{e}

class C<T> where T <: X<Int32>, T <: Y{}

interface I<T> where T <: X<Int32>, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X<Int32>, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<X<Int64>>() // EXPECTED: regex no matching function declaration for function call
    R<X<Int64>>()  // EXPECTED: regex generics type arguments do not match the constraint
    bar(R2<X<Int64>>())  // EXPECTED: regex no matching function declaration for function call
    E<X<Int64>>.e  // EXPECTED: regex generics type arguments do not match the constraint
    C<X<Int64>>() // EXPECTED: regex generics type arguments do not match the constraint
    func foo(a:I<X<Int64>>){} // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}
