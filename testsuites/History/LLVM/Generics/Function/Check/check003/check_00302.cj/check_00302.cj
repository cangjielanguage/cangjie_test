// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64,Int64>'
// ASSERT: scan instantiation 'B<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'B<Int64,Int64>'
// ASSERT: scan instantiation 'C<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'C<Int64,Int64>'

class A<X,Y>{
func test(a:Int64,b:Int64,c:Int64){}
func test(a:Int64,b:Int64,c:X){}
}

record B<X,Y>{
func test(a:Int64,b:Int64,c:Int64){}
func test(a:Int64,b:Int64,c:X){}
}

interface C<X,Y>{
func test(a:Int64,b:Int64,c:Int64){}
func test(a:Int64,b:Int64,c:X){}
}


trait X{}

append A<Int64,Int64> with X{}
append B<Int64,Int64> with X{}
append C<Int64,Int64> with X{}

func main(): Int64 {
return 0
}
