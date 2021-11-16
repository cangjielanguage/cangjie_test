// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main():Int64 {
    var a1: IntNative = -9223372036854775808 - 1 // EXPECTED: regex error.*?overflow in 'Subtraction' calculation
    var a2: IntNative = 9223372036854775807 + 1 // EXPECTED: regex error.*?overflow in 'Addition' calculation
    return 0
}

