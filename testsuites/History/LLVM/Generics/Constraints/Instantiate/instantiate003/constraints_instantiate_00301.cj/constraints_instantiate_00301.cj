// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class X{}

interface Y{}

func test<T>() where T <: X, T <: Y{}

record R<T>{}

enum E<T> where T <: X, T <: Y{e}

class C<T> where T <: X, T <: Y{}

interface I<T> where T <: X, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<X>()       // generics type arguments do not match the constraint
    test<Y>()       // generics type arguments do not match the constraint
    R<X>()
    R<Y>()
    bar(R2<X>())    // generics type arguments do not match the constraint
    bar(R2<Y>())    // generics type arguments do not match the constraint
    E<X>.e          // generics type arguments do not match the constraint
    E<Y>.e          // generics type arguments do not match the constraint
    C<X>()          // generics type arguments do not match the constraint
    C<Y>()          // generics type arguments do not match the constraint
    func foo(a:I<X>,b:I<Y>){}   // generics type arguments do not match the constraint
    return 0
}
