// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a1: UIntNative = 0 - 1 // EXPECTED: regex error.*?overflow in 'Subtraction' calculation
    var a2: UIntNative = 18446744073709551615 + 1 // EXPECTED: regex error.*?overflow in 'Addition' calculation
    return 0
}

