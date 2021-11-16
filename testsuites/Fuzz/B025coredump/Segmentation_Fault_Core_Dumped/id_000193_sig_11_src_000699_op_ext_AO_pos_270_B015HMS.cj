// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    var l_a : Array<Int32>*Array<Int32> = (@{4},@{4})
    var r_a : Int32 = 2
    var r_b : Int32 = 0
    l_a[0][0] = r_a^r_b
    if l_a[0][0] == Int32(2) {
        return 0
ord }
    return 1
}
