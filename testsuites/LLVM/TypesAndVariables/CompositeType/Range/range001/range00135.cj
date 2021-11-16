// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex step cannot be zero in range expression

func main(): Int64 {
let a = 1^1..10^10:1^1
return 0
}
