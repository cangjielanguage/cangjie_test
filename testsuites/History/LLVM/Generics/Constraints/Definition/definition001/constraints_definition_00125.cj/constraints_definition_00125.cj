// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class Z<T>{
    func foo(){}
}

enum E<X> where X <: Z<Z<Z<Z<Int32>>>>{e}

trait T{
    func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z<Z<Z<Z<Int32>>>>{
   input.foo()
}

record R<X> where X <: Z<Z<Z<Z<Int32>>>>{
    var i : X
    init(input:X){
        //input.foo()
        i = input
    }
}

class C<X> where X <: Z<Z<Z<Z<Int32>>>>{
    init(input:X){
        let a : Unit = input.foo()
    }
}

interface I<X> where X <: Z<Z<Z<Z<Int32>>>>{
    //let b = input.foo()
}

append<X> R<X> with T where X <: Z<Z<Z<Z<Int32>>>>{
    func foo(a:R<X>):Unit{
        a.i.foo()
        return
    }
}

func main():Int64{
    return 0
}
