// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : UInt32 = 127
    var aa : UInt32 = 0
    var b : Int8 = Int8(a)
    var bb : Int8 = Int8(aa)
    var c : Int8 = 127
    var cc : Int8 = 0

if b == c && bb =. cc {
        return 0
    }
    return 1
}
