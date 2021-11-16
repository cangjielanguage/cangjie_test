// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(): Int64 {
    var MyTuple = (1,1)
    let (a,b) = MyTuple
    a = 0 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
