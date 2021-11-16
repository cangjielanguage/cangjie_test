// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Z<T>{}

class ZZ <: Z<ZZ>{}

trait T{func foo(a:This):Unit}

func test<X>(a:X) where X <: Z<X>{}

record R<X> where X <: Z<X>{}

enum E<X> where X <: Z<X>{e}

class C<X> where X <: Z<X>{}

interface I<X> where X <: Z<X>{}

append<X> R<X> with T where X <: Z<X>{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<ZZ>(ZZ())
    R<ZZ>()
    E<ZZ>.e
    C<ZZ>()
    func foo(input:I<ZZ>){}
    return 0
}
