// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import format.*

func main():Int64 {
    var i1: Int8 = -128
    var i2: Int16 = -32768
    var i3: Int32 = -2147483648
    var i4: Int64 = -9223372036854775808

    var i5: Int8 = 127
    var i6: Int16 = 32767
    var i7: Int32 = 2147483647
    var i8: Int64 = 9223372036854775807

    var u1: UInt8 = 255
    var u2: UInt16 = 65535
    var u3: UInt32 = 4294967295
    var u4: UInt64 = 18446744073709551615

    var u5: UInt8 = 0

    var flags =  '-'
    var width =  20
    var precision = 8
    var special = 'x'
    var res1 = i1.format("${flags}${width}.${precision}${special}")
    var res2 = i2.format("${flags}${width}.${precision}${special}")
    var res3 = i3.format("${flags}${width}.${precision}${special}")
    var res4 = i4.format("${flags}${width}.${precision}${special}")
    var res5 = i5.format("${flags}${width}.${precision}${special}")
    var res6 = i6.format("${flags}${width}.${precision}${special}")
    var res7 = i7.format("${flags}${width}.${precision}${special}")
    var res8 = i8.format("${flags}${width}.${precision}${special}")
    var res9 = u1.format("${flags}${width}.${precision}${special}")
    var res10 = u2.format("${flags}${width}.${precision}${special}")
    var res11 = u3.format("${flags}${width}.${precision}${special}")
    var res12 = u4.format("${flags}${width}.${precision}${special}")
    var res13 = u5.format("${flags}${width}.${precision}${special}")

    if (res1 != "-00000080           ") {
        return 1
    }
    if (res2 != "-00008000           ") {
        return 2
    }
    if (res3 != "-80000000           ") {
        return 3
    }
    if (res4 != "-8000000000000000   ") {
        return 4
    }
    if (res5 != "0000007f            ") {
        return 5
    }
    if (res6 != "00007fff            ") {
        return 6
    }
    if (res7 != "7fffffff            ") {
        return 7
    }
    if (res8 != "7fffffffffffffff    ") {
        return 8
    }
    if (res9 != "000000ff            ") {
        return 9
    }
    if (res10 != "0000ffff            ") {
        return 10
    }
    if (res11 != "ffffffff            ") {
        return 11
    }
    if (res12 != "ffffffffffffffff    ") {
        return 12
    }
    if (res13 != "00000000            ") {
        return 13
    }

    return 0

}