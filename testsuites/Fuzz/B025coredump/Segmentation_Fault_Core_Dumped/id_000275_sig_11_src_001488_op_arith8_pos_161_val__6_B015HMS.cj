// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record LA{
  var a : Int32
}
func main(): Int64 {
    var l_a = LA(4)
    l_a.[++
    if l_a.a != Int32(5) {
        return 1
    }
    l_a.a--
    if l_a.a != Int32(4) {
        return 2
    }
    return 0
}
