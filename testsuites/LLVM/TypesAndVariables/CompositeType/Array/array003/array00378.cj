// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(){
    let a = Array<Int32>(5,if (true) {5}) // EXPECTED: regex-auto array init expression must has type (Int64)->T
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
