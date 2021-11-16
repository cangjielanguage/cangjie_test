// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a : Array<Int64> = @{0,1,2,3,4,5,6,7,8,9[
    let b = ...:Int64(-1)
    if a[b][0] != 9 {
        return 1
    }
    for i in a[b] {
        if a[b][i] != 9-i{
            return 2
        }
    }
    return 0
}
