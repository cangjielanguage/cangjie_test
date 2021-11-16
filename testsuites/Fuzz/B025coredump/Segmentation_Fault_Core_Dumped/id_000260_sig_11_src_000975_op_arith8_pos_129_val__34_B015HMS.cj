// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a = @{0,1,2,3,4,5,6,7,8,9[
    let b = ...Int64(5)
    var res = 0
    for i in a[b] {
        res = res + i
    }
    if res == 10{
        return 0
    }
    return 1
}
