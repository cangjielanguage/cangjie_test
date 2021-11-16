// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main():Int64 {
    var a1: IntNative = -9223372036854775809 // EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'IntNative'
    var a2: IntNative = 9223372036854775808 // EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'IntNative'
    return 0
}
