// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
trait Y{}

trait X where This <: Y{}

append Bool with Y{}

func test<T>() where T <: X, T <: Y{}

record R<T> where T <: X, T <: Y{}

enum E<T> where T <: X, T <: Y{e}

class C<T> where T <: X, T <: Y{}

interface I<T> where T <: X, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<Bool>() // EXPECTED: regex no matching function declaration for function call
    R<Bool>() // EXPECTED: regex generics type arguments do not match the constraint
    bar(R2<Bool>()) // EXPECTED: regex no matching function declaration for function call
    E<Bool>.e  // EXPECTED: regex generics type arguments do not match the constraint
    C<Bool>()  // EXPECTED: regex generics type arguments do not match the constraint
    func foo(a:I<Bool>){}  // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}
