// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : Float64 = -2.2
    var aa : Float64 = 2.2
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var c : Float32 = -2.2
    var cc : Float32 = 2.2

    if b == c && bb =. cc {
        return 0
    }
    return 1
}
