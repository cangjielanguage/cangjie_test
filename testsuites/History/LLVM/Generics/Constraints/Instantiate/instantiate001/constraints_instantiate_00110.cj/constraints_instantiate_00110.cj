// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Z{}

interface ZZ <: Z{}

class ZZZ <: ZZ{}

trait T{func foo(a:This):Unit}

func test<X>(a:X) where X <: Z{}

record R<X> where X <: Z{}

enum E<X> where X <: Z{e}

class C<X> where X <: Z{}

interface I<X> where X <: Z{}

append<X> R<X> with T where X <: Z{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<ZZ>(ZZZ())
    R<ZZ>()
    E<ZZ>.e
    C<ZZ>()
    func foo(input:I<ZZ>){}
    return 0
}
