// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64,Int64>'
// ASSERT: scan instantiation 'B<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'B<Int64,Int64>'
// ASSERT: scan instantiation 'C<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'C<Int64,Int64>'

class A<X,Y>{
static func test(a:Int64,b:Int64,c:X){}
static func test(a:X,b:Int64,c:Y){}
}

record B<X,Y>{
static func test(a:Int64,b:Int64,c:X){}
static func test(a:X,b:Int64,c:Y){}
}

interface C<X,Y>{
static func test(a:Int64,b:Int64,c:X){}
static func test(a:X,b:Int64,c:Y){}
}


func main(): Int64 {
A<Int64,Int64>.test(1,1,1)
B<Int64,Int64>.test(1,1,1)
C<Int64,Int64>.test(1,1,1)
return 0
}
