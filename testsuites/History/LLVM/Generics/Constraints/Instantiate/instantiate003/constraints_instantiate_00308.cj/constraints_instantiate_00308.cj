// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait Y{}

class X{}

func test<T>() where T <: X, T <: Y{}

record R<T> where T <: X, T <: Y{}

enum E<T> where T <: X, T <: Y{e}

class C<T> where T <: X, T <: Y{}

interface I<T> where T <: X, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<X>() // EXPECTED: regex no matching function declaration for function call
    R<X>() // EXPECTED: regex generics type arguments do not match the constraint
    bar(R2<X>()) // EXPECTED: regex no matching function declaration for function call
    E<X>.e  // EXPECTED: regex generics type arguments do not match the constraint
    C<X>()  // EXPECTED: regex generics type arguments do not match the constraint
    func foo(a:I<X>){}  // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}
