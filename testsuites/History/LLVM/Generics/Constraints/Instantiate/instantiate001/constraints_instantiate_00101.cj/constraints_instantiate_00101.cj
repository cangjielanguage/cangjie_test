// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait T{func foo(a:This):Unit}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(a:X) where X <: T{}

record R<X> where X <: T{}

enum E<X> where X <: T{e}

class C<X> where X <: T{}

interface I<X> where X <: T{}

append<X> R<X> with T where X <: T{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<Unit>(())
    R<Unit>()
    E<Unit>.e
    C<Unit>()
    func foo(input:I<Unit>){}
    return 0
}
