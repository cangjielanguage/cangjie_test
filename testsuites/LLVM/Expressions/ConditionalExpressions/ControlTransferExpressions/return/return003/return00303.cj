// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex type of function body is incompatible with return type
func main(): Int64 {
return 0
@{return 1}
}
