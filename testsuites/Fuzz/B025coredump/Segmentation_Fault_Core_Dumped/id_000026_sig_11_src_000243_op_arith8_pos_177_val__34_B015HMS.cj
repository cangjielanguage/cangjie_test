// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a : Int32*Int32 = (1,1)
    let myArray : Array<(Int32*Int32)> = @{a,(1,1)[
    return 0
}
