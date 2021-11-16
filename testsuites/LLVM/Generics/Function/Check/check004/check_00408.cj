// DEPENDENCE: 407.cj 407.cfg
// EXEC: %compiler %cmp_opt -c 407.cj -o 407.%middle
// ERRCHECK: %compiler %cmp_opt %f -import-config 407.cfg 407.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Generics-X,Generics-X>' causes ambiguous functions named 'test' in declaration 'A<Generics-X,Generics-X>'
// ASSERT: scan instantiation 'B<Generics-X,Generics-X>' causes ambiguous functions named 'test' in declaration 'B<Generics-X,Generics-X>'
// ASSERT: scan instantiation 'C<Generics-X,Generics-X>' causes ambiguous functions named 'test' in declaration 'C<Generics-X,Generics-X>'

import test407.*

open class A<X,Y>{
static func test(a:Int64,b:Int64,c:Y){}
static func test(a:Int64,b:Int64,c:X){}
}

record B<X,Y>{
static func test(a:Int64,b:Int64,c:Y){}
static func test(a:Int64,b:Int64,c:X){}
}

interface C<X,Y>{
static func test(a:Int64,b:Int64,c:Y){}
static func test(a:Int64,b:Int64,c:X){}
}

func test<X>(input:C<X,X>){
A<X,X>()
B<X,X>()
var c : C<X,X>
}

func main(): Int64 {
return 0
}
