// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto array init expression must has type (Int64)->T
func main(){
    let a = Array<Int32>(5,(5,5))
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
