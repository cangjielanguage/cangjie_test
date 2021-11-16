// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{
func test(a:Int8):Int64{return 1}
func test(a:Int16):Int64{return 1}
}


func main():Int64{
var a : A = A()
var b = a.test // Expected: overload conflict?
return 0
}
