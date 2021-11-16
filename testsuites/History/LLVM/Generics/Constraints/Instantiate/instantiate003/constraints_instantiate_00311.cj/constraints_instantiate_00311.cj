// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait Y{}

open class X<T>{}

class Z <: X<Int32>{}

append Z with Y{}

func test<T>() where T <: X<Int32>, T <: Y{}

record R<T> where T <: X<Int32>, T <: Y{}

enum E<T> where T <: X<Int32>, T <: Y{e}

class C<T> where T <: X<Int32>, T <: Y{}

interface I<T> where T <: X<Int32>, T <: Y{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X<Int32>, T <: Y{ func bar(a:R2<T>){} }

func main():Int64{
    test<Z>()
    R<Z>()
    bar(R2<Z>())
    E<Z>.e
    C<Z>()
    func foo(a:I<Z>){}
    return 0
}
