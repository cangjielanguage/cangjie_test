// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'A<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'B<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'B<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'C<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'C<Generics-T,Generics-T>'

open class A<X,Y>{
func test(a:Int64,b:Int64,c:Y){}
func test(a:Int64,b:Int64,c:X){}
}

record B<X,Y>{
func test(a:Int64,b:Int64,c:Y){}
func test(a:Int64,b:Int64,c:X){}
}

interface C<X,Y>{
func test(a:Int64,b:Int64,c:Y){}
func test(a:Int64,b:Int64,c:X){}
}

func test<T>(){
A<T,T>()
B<T,T>()
var c : C<T,T>
}

func main(): Int64 {
return 0
}
