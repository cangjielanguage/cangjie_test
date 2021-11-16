// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var lit01 = 9223372036854775807 * 1
    var lit02 = 9223372036854775807 - 1
    var lit03 = 9223372036854775806 + 1
    var lit04 = 9223372036854775807 / 1
    var lit05 = -9223372036854775808 * 1
    var lit06 = -9223372036854775807 - 1
    var lit07 = -9223372036854775808 + 1
    var lit08 = -9223372036854775808 / 1

//    print("lit01: " + lit01.toString() + "\n")
//    print("lit02: " + lit02.toString() + "\n")
//    print("lit03: " + lit03.toString() + "\n")
//    print("lit04: " + lit04.toString() + "\n")
//    print("lit05: " + lit05.toString() + "\n")
//    print("lit06: " + lit06.toString() + "\n")
//    print("lit07: " + lit07.toString()+ "\n")
//    print("lit08: " + lit08.toString()+ "\n")
//
    if (lit01 != 9223372036854775807) {
        return 1
    }
    if (lit02 != 9223372036854775806) {
        return 1
    }
    if (lit03 != 9223372036854775807) {
        return 1
    }
    if (lit04 != 9223372036854775807) {
        return 1
    }
    if (lit05 != -9223372036854775808) {
        return 1
    }
    if (lit06 != -9223372036854775808) {
        return 1
    }
    if (lit07 != -9223372036854775807) {
        return 1
    }
    if (lit08 != -9223372036854775808) {
        return 1
    }
    return 0
}
