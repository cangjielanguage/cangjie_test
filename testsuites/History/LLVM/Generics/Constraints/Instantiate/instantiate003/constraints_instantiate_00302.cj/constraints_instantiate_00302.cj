// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Y{}

class X <: Y{}

func test<T>() where T <: X, T <: Y{}

record R<T>{}

enum E<T> where T <: X, T <: Y{e}

class C<T> where T <: X, T <: Y{}

interface I<T> where T <: X, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<X>()
    //test<Y>()
    R<X>()
    //R<Y>()
    bar(R2<X>())
    //bar(R2<Y>())
    E<X>.e
    //E<Y>.e
    C<X>()
    //C<Y>()
    //func foo(a:I<X>,b:I<Y>){}
    func foo(a:I<X>){}
    return 0
}
