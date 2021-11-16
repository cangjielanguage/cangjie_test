// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : UInt8 = 255
    var aa : UInt8 = 0
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var c : Float32 = 255
    var cc : Float32 = 0

    if b == c && bb =. cc {
        return 0
    }
    return 1
}
