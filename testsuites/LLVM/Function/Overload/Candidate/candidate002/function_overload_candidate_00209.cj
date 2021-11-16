// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{
// func test(a:Int8):Int64{return 1}
func test(a:Int16):Int64{return 1}
var a = this.test // EXPECTED: regex-auto 'test' is not allowed to be accessed before all member variables are initialized
}


func main():Int64{
return 0
}
