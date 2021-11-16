// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Z{}

trait T{func foo(a:This):Unit}

func test<X>(a:X) where X <: Z{}

record R<X> where X <: Z{}

enum E<X> where X <: Z{e}

class C<X> where X <: Z{}

interface I<X> where X <: Z{}

append<X> R<X> with T where X <: Z{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<Z>(Z())
    R<Z>()
    E<Z>.e
    C<Z>()
    func foo(input:I<Z>){}
    return 0
}
