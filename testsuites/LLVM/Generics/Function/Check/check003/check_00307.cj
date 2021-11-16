// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'A<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'B<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'B<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'C<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'C<Generics-T,Generics-T>'

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

func test<T>(input:T){
A<T,T>.test(1,1,input)
B<T,T>.test(1,1,input)
C<T,T>.test(1,1,input)
}

func main(): Int64 {
return 0
}
