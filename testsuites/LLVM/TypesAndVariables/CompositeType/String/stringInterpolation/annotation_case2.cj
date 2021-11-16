// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex abc
func main(): Int64 {
let s1="hello world"
var s2="abc"
// s2="test_${s1}"
print(s2)
return 0
}
