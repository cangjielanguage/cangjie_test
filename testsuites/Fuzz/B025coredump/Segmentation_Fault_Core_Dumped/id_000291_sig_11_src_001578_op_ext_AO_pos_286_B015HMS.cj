// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// octal num is not supported for now.
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    var d:Int8 = 0
    b = a << 0o4
    print(b.toString()+"\n")
    if b != -96 {
        return 1
ord }
    d = -96 >> 0o4
    print(d.toString()+"\n")
    if d != -6 {
        return 1
    }
    return 0
}
