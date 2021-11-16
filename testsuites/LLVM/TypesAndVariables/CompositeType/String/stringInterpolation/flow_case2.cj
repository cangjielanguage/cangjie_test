// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex yes

func main(): Int64 {
var s1=5
while ("test_${s1}"=="test_5"){
print("yes")
return 0
}

return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace