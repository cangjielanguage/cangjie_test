// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Z{
static func test(){}
}

enum E<X> where X <: Z{e}

trait T{
func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z{
X.test()
}

record R<X> where X <: Z{
var i : X
init(input:X){
X.test()
i = input
}
}

class C<X> where X <: Z{
init(input:X){
let a : Unit = X.test()
}
}

interface I<X> where X <: Z{
//let b = X.test()
}

append<X> R<X> with T where X <: Z{
func foo(a:R<X>):Unit{
X.test()
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
