// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(a:Int16):Int64{return 1}
func test(a:Int16):Int64{return 2} // EXPECTED: regex function 'test' has overload conflicts


func main():Int64{
func test1(a:Int16):Int64{return 3}
func test1(a:Int16):Int64{return 4}// EXPECTED: regex function 'test1' has overload conflicts
return 1
}
