// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    var l_a : Array<Unit>*Array<Unit> = (@{()},@{()[)
    
    l_a[0][0] = ()
    if l_a[0][0] == () {
    return 0
    }
    return 1
}
