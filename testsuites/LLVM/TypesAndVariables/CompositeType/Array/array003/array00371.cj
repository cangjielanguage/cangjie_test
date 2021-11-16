// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex array size must be of type Int64
func main(){
    let a = Array<Int32>({},5)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
