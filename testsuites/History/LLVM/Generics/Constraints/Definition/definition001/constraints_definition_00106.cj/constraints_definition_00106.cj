// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


trait T{
    func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(a:X) where X <: T{
   foo(a)
}

record R<X> where X <: T{
    var i : X
    init(input:X){
        let a : Unit = foo(input)
        i = input
    }
}

enum E<X> where X <: T{e}

class C<X> where X <: T{
    init(input:X){
        let a : Unit = foo(input)
    }
}

interface I<X> where X <: T{
    //let b : Unit = foo(a)
}

append<X> R<X> with T where X <: T{
    func foo(a:R<X>):Unit{
        foo(a.i)
    }
}

func main():Int64{
    test<Unit>(())
    R<Unit>(())
    E<Unit>.e
    C<Unit>(())
    func foo(input:I<Unit>){}
    return 0
}
