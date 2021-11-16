// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64,Int64>'
// ASSERT: scan instantiation 'B<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'B<Int64,Int64>'
// ASSERT: scan instantiation 'C<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'C<Int64,Int64>'

class A<X,Y>{
func test(a:Int64,b:X,c:Int64){}
func test(a:Int64,b:Y,c:Int64){}
}

record B<X,Y>{
func test(a:Int64,b:X,c:Int64){}
func test(a:Int64,b:Y,c:Int64){}
}

interface C<X,Y>{
func test(a:Int64,b:X,c:Int64){}
func test(a:Int64,b:Y,c:Int64){}
}

func forC(input:C<Int64,Int64>){}

func main(): Int64 {
var a : A<Int64,Int64> = A<Int64,Int64>()
var b : B<Int64,Int64> = B<Int64,Int64>()
return 0
}
