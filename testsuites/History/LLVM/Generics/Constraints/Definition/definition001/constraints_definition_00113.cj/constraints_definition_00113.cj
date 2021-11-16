// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
class Z{
    private var z : Int64 = 1
}

enum E<X> where X <: Z{e}

trait T{
    func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z{
   input.z // EXPECTED: regex can not access field 'z'
}

record R<X> where X <: Z{
    var i : X
    init(input:X){
        input.z // EXPECTED: regex can not access field 'z'
        i = input
    }
}

class C<X> where X <: Z{
    init(input:X){
        input.z // EXPECTED: regex can not access field 'z'
    }
}

interface I<X> where X <: Z{
    //let b = input.z
}

append<X> R<X> with T where X <: Z{
    func foo(a:R<X>):Unit{
        a.i.z // EXPECTED: regex can not access field 'z'
        return
    }
}

func main():Int64{
    test<Z>(Z())
    R<Z>(Z())
    E<Z>.e
    C<Z>(Z())
    func foo(input:I<Z>){}
    return 0
}
