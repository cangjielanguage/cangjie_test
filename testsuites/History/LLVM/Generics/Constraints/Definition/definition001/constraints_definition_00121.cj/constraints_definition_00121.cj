// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

interface Z{
static func foo(){}
}

class Z_C <: Z{}

enum E<X> where X <: Z{e}

trait T{
func foo(a:This):Unit
}

append Unit with T{func foo(a:Unit):Unit{}}

func test<X>(input:X) where X <: Z{
X.foo()
}

record R<X> where X <: Z{
var i : X
init(input:X){
X.foo()
i = input
}
}

class C<X> where X <: Z{
init(input:X){
let a : Unit = X.foo()
}
}

interface I<X> where X <: Z{
//let b = X.foo()
}

append<X> R<X> with T where X <: Z{
func foo(a:R<X>):Unit{
X.foo()
return
}
}

func main():Int64{
test<Z>(Z_C())  // EXPECTED: regex can not instantiate 'Generics-X' by interface or abstract class 'Interface-Z' for it is used as static access
R<Z>(Z_C())     // EXPECTED: regex can not instantiate 'Generics-X' by interface or abstract class 'Interface-Z' for it is used as static access
E<Z>.e
C<Z>(Z_C())     // EXPECTED: regex can not instantiate 'Generics-X' by interface or abstract class 'Interface-Z' for it is used as static access
func foo(input:I<Z>){}
return 0
}
