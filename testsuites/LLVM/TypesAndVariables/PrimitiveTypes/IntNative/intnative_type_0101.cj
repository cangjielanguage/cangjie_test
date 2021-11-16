// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a1: IntNative = 1
    var b1: Int64 = a1 // EXPECTED: regex error.*?initializer's type is incompatible with variable declaration 'b1'
    return 0
}