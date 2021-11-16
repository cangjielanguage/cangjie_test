// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(a:Int16):Int64{return 1}
var test: Int8->Int64 = { a:Int16 => return 1} // EXPECTED: regex redefinition of declaration 'test'


func main():Int64{
func test1(a:Int16):Int64{return 3}
var test1: Int8->Int64 = { a:Int16 => return 1}// EXPECTED: regex redefinition of declaration 'test1'
return 1
}
