// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

class Z{}

enum E<X> where X <: Z{e}

trait T{
    func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(a:X) where X <: Z{
   X() // EXPECTED: regex calling object is not a function or constructors
}

record R<X> where X <: Z{
    var i : X
    init(input:X){
        let a : X = X() // EXPECTED: regex calling object is not a function or constructors
        i = input
    }
}

class C<X> where X <: Z{
    init(input:X){
        let a : Unit = X() // EXPECTED: regex calling object is not a function or constructors
    }
}

interface I<X> where X <: Z{
    let b : X = X() // EXPECTED: regex calling object is not a function or constructors
}

append<X> R<X> with T where X <: Z{
    func foo(a:R<X>,b:Int64):Unit{
        X() // EXPECTED: regex calling object is not a function or constructors
        return
    }
}

func main():Int64{
    test<Unit>(())
    R<Unit>(())
    E<Unit>.e
    C<Unit>(())
    func foo(input:I<Unit>){}
    return 1
}
