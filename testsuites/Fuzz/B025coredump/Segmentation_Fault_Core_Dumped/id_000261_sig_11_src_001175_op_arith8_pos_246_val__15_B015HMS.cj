// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var l : (Int32)->Int32
    var r : (Int32)->Int32
    func test(a:Int32):Int32{a}
    r = test
    var temp = r
    l = temp
    if l(1) =. r(1) {
        return 0
    }
    return 1
}
