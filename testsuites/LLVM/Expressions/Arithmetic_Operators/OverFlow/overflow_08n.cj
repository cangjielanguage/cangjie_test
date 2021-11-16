// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var i1: UInt8 = -2   // EXPECTED: regex the number '-2' exceeds the value range of type 'UInt8'
    var i2: UInt16 = -3   // EXPECTED: regex the number '-3' exceeds the value range of type 'UInt16'
    var i3: UInt32 = -4   // EXPECTED: regex the number '-4' exceeds the value range of type 'UInt32'
    var i4: UInt64 = -4   // EXPECTED: regex the number '-4' exceeds the value range of type 'UInt64'
    var i5: UInt8 = 256   // EXPECTED: regex the number '256' exceeds the value range of type 'UInt8'
    var i6: UInt16 = 65535 +1   // EXPECTED: regex  overflow in 'Addition' calculation
    var i7: UInt32 = 4294967295 +2  // EXPECTED: regex overflow in 'Addition' calculation
    var i8: UInt64 = 18446744073709551615**2   // EXPECTED: regex overflow in 'Power' calculation
    return 0
}