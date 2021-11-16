// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface T<TT>{operator func +(b:TT):Unit}

open class Father{}

extend Father <: T<Child>{operator func +(b:Child):Unit{}}

class Child <: Father{}

func test<X>(a:X) where X <: T<X>{}

record R<X> where X <: T<X>{}

enum E<X> where X <: T<X>{e}

class C<X> where X <: T<X>{}

interface I<X> where X <: T<X>{}

extend R<X> <: T<R<X>> where X <: T<X>{operator func +(b:R<X>):Unit{}}

func main():Int64{
    test<Child>(Child())
    R<Child>()
    E<Child>.e
    C<Child>()
    func foo(input:I<Child>){}
    return 0
}
