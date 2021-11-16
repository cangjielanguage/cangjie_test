// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : Int16 = 127
    var aa : Int16 = -128
    var aaa : Int16 = 0
    var b : Int8 = Int8(a)
    var bb : Int8 = Int8(aa)
    var bbb : Int8 = Int8(aaa)
    var c : Int8 = 127
    var cc : Int8 = -128
    var ccc : Int8 = 0

    if b == c && bb =. cc && bbb == ccc {
        return 0
    }
    return 1
}
