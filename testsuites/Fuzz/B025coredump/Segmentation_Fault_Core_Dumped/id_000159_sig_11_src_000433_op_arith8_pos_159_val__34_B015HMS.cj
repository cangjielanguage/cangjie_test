// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var lambda = (input:Array<Int64>)=>{input}
    var a = @{1,0[
    return lambda(a)[1]
}
