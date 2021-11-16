// EXEC: %compiler %cmp_opt -c %f
trait update{
    func foo(a:This):Int32
}

record A<X>{}

append<X> A<X> with update{
    func foo(a:A<X>):Int32{1}
}

record B<T> where T <: update{}

var b = B<A<Int32>>()

func test<T>()where T <: update{}

var c = test<A<Int32>>()

class C<T>where T <: update{}

var d = C<A<Int32>>()

open class D<T>where T <: update{}

class E <: D<A<Int32>>{}
