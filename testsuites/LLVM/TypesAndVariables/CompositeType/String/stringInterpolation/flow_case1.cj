// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex yes

func main(): Int64 {
let s1="hello world"
if ("test_${s1}" =="test_hello world"){
print("yes")
}
else{
print("no")
}
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
