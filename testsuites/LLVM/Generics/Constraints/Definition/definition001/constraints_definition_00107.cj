// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface T{
    operator func +(b:Int64):Unit
}

extend Unit <: T {operator func +(b:Int64):Unit{}}

func test<X>(a:X) where X <: T{
   a+Int64(1)
}

record R<X> where X <: T{
    var i : X
    init(input:X){
        let a : Unit = input+1
        i = input
    }
}

enum E<X> where X <: T{e}

class C<X> where X <: T{
    init(input:X){
        let a : Unit = input+Int64(1)
    }
}

interface I<X> where X <: T{
    //let b : Unit = foo(a)
}

extend R<X> <: T where X <: T{
    operator func +(b:Int64):Unit{
        this.i+b
        return
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
