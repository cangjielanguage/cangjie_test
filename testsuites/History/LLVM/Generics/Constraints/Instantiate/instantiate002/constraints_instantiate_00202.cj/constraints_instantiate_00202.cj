// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Z<T>{}

class ZZ<T> <: Z<ZZ<T>>{}


trait T{func foo(a:This):Unit}

func test<X>(a:X) where X <: Z<X>{}

record R<X> where X <: Z<X>{}

enum E<X> where X <: Z<X>{e}

class C<X> where X <: Z<X>{}

interface I<X> where X <: Z<X>{}

append<X> R<X> with T where X <: Z<X>{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<ZZ<Int32>>(ZZ<Int32>())
    R<ZZ<Int32>>()
    E<ZZ<Int32>>.e
    C<ZZ<Int32>>()
    func foo(input:I<ZZ<Int32>>){}
    return 0
}
