// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{
func test(a:A,b:Int16):Int64{return 1}
}
trait B{
func test(a:This,b:Int8):Int64
}
append A with B{
func test(a:A,b:Int8):Int64{return 2}
}


func main():Int64{
var a : A = A()
if (a.test(1) == 2) { // EXPECTED: regex no matching function declaration for function call
return 0
}
return 1
}
