// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_hello world for match case if class continue append with Package break return  Map Set abstype List interface super enum this implements static open extends external let var throw record trait init func
func main(): Int64 {
let s1="hello world for match case if class continue append with Package break return  Map Set abstype List interface super enum this implements static open extends external let var throw record trait init func"
let s2="test_${s1}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace