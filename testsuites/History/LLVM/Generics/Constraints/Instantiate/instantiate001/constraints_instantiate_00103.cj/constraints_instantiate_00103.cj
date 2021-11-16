// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait T{func foo(a:This):Unit}

open class Father{}

append Father with T{func foo(a:Father):Unit{}}

class Child <: Father{}

func test<X>(a:X) where X <: T{}

record R<X> where X <: T{}

enum E<X> where X <: T{e}

class C<X> where X <: T{}

interface I<X> where X <: T{}

append<X> R<X> with T where X <: T{func foo(a:R<X>):Unit{}}

func main():Int64{
    test<Child>(Child())
    R<Child>()
    E<Child>.e
    C<Child>()
    func foo(input:I<Child>){}
    return 0
}
