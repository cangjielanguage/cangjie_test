// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : UInt16 = 255
    var aa : UInt16 = 0
    var b : UInt8 = UInt8(a)
    var bb : UInt8 = UInt8(aa)
    var c : UInt8 = 255
    var cc : UInt8 = 0

    if b == c && bb =. cc {
        return 0
    }
    return 1
}
