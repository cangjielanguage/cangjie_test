// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Z{
private func test(){}
}

enum E<X> where X <: Z{e}

trait T{
func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z{
input.test() // EXPECTED: regex no method 'test' match for generic member access function call when searching in upper bounds
}

record R<X> where X <: Z{
var i : X
init(input:X){
input.test() // EXPECTED: regex no method 'test' match for generic member access function call when searching in upper bounds
i = input
}
}

class C<X> where X <: Z{
init(input:X){
let a : Unit = input.test() // EXPECTED: regex no method 'test' match for generic member access function call when searching in upper bounds
}
}

interface I<X> where X <: Z{
//let b = input.test()
}

append<X> R<X> with T where X <: Z{
func foo(a:R<X>):Unit{
a.i.test() // EXPECTED: regex no method 'test' match for generic member access function call when searching in upper bounds
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
