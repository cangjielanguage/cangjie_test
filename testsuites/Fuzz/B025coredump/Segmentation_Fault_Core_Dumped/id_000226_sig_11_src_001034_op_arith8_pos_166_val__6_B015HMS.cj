// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    var l_a : Unit = ()
    var r_a : Int32 = 1
    l_a = r_[++
    if l_a == () {
        return 0
    }
    return 1
}
