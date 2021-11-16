// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: scan-begin test_hello
// ASSERT: scan-next world


func main(): Int64 {
var s1="""
this
is multiline"""
s1="""
hello
world"""
let s2="test_${s1}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace