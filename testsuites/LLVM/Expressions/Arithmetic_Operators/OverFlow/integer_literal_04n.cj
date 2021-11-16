// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var lit01 = -0b1000000000_00000000000_0000000000000_00000000000000000000000000_0000_1   // EXPECTED: regex  the number '-0b1000000000_00000000000_0000000000000_00000000000000000000000000_0000_1' exceeds the value range of type 'Int'
    var lit02 = 0B111111111111111111111111111111111111111111111111111111111111111111    // EXPECTED: regex the number '0B111111111111111111111111111111111111111111111111111111111111111111' exceeds the value range of type 'Int'
    let lit03 = -0o1000000__000000____000000000_1        // EXPECTED: regex the number '-0o1000000__000000____000000000_1' exceeds the value range of type 'Int'
    let lit04 = 0O7_7777_7777_7777_7777_77776            // EXPECTED: regex the number '0O7_7777_7777_7777_7777_77776' exceeds the value range of type 'Int'
    let lit05 = -2_4_
    var lit06 = -0x8000_0000_0000_0000_7     // EXPECTED: regex the number '-0x8000_0000_0000_0000_7' exceeds the value range of type 'Int'
    var lit07 =  0X7fffff__fffffff_______________fff1   // EXPECTED: regex the number '0X7fffff__fffffff_______________fff1' exceeds the value range of type 'Int'
    var lit08 = -9223_37_2_0368_5477_5809        // EXPECTED: regex the number '-9223_37_2_0368_5477_5809' exceeds the value range of type 'Int'
    var lit09 = 9_2_2_3_3_7_2_0_3_6_8_5_4_7_7_5_8_1_9
    9223372036854775819.toString()      // EXPECTED: regex the number '9223372036854775819' exceeds the value range of type 'Int64'

//    print("lit01: " + lit01.toString()+"\n")
//    print("lit02: " + lit02.toString()+"\n")
//    print("lit03: " + lit03.toString()+"\n")
//    print("lit04: " + lit04.toString()+"\n")
//    print("lit05: " + lit05.toString()+"\n")

    return 0
}
