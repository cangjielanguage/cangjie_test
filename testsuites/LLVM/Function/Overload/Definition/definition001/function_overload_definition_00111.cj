// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{
init(){}
func init(){} // EXPECTED: regex-auto 'init' is keyword not identifier, you can use '`init`' instead
}

record B{
init(){}
func init(){} // EXPECTED: regex-auto 'init' is keyword not identifier, you can use '`init`' instead
}

func main():Int64{
return 1
}
