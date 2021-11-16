// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface Z{
let i = 1
}

class Z_C <: Z{}

enum E<X> where X <: Z{e}

trait T{
func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z{
X.i // EXPECTED: regex undeclared identifier 'i'
}

record R<X> where X <: Z{
var i : X
init(input:X){
X.i // EXPECTED: regex undeclared identifier 'i'
i = input
}
}

class C<X> where X <: Z{
init(input:X){
let a : Unit = X.i // EXPECTED: regex undeclared identifier 'i'
}
}

interface I<X> where X <: Z{
//let b = X.i
}

append<X> R<X> with T where X <: Z{
func foo(a:R<X>):Unit{
X.i // EXPECTED: regex undeclared identifier 'i'
return
}
}

func main():Int64{
test<Z>(Z_C())
R<Z>(Z_C())
E<Z>.e
C<Z>(Z_C())
func foo(input:I<Z>){}
return 0
}
