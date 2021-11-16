// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var lit01 = -0b1000000000_00000000000_0000000000000_00000000000000000000000000_0000_ - 0b1 // EXPECTED: regex overflow in 'Subtraction' calculation
    var lit02 = 0B1111111111111111111111111111111111111111111111111111111111111111+1  // EXPECTED: regex exceeds the value range of type 'Int64'
    var lit03 = -9223_37_2_0368_5477_5808 - 1   // EXPECTED: regex  overflow in 'Subtraction' calculation
    var lit04 = 18446744073709551615+1 // EXPECTED: regex exceeds the value range of type 'Int64'

    print("lit01: " + lit01.toString()+"\n")
    print("lit02: " + lit02.toString()+"\n")
    print("lit03: " + lit03.toString()+"\n")
    print("lit04: " + lit04.toString()+"\n")

    return 0
}
