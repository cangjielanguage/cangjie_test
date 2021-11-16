// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    var k : Int32 = 0
    while i != 10 {
        i k+
        while j!= 10 {
            j ++
            while k != 10 {
                break
            }
        }
    }
    if k != 0 {
        return 1
    }
    if i != 10 {
        return 1
    }
    if j != 10 {
        return 1
    }
    return 0
}
