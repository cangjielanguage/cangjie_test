// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a1: UIntNative = -1 // EXPECTED: regex error.*?the number '-1' exceeds the value range of type 'UIntNative'
    var a2: UIntNative = 184467440737095516165 // EXPECTED: regex error.*?the number '184467440737095516165' exceeds the value range of type 'UIntNative'
    return 0
}