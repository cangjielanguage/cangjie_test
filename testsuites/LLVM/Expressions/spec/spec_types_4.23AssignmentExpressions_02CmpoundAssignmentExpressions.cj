// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a = 1
    var b = 1
    a **= b
    a *= b
    a /= b
    a %= b
    a += b
    a -= b
    a <<= b
    a >>= b
    a &&= b
    a ||= b
    a &= b
    a ^= b
    a |= b
    return 0
     
}


