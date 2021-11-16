// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(){
let a = Array<Int64>(5,return 0) // EXPECTED: regex expression of Nothing type cannot appear here currently
return 0
}
