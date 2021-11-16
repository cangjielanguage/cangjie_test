// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 |compare %f

func main(): Int64 {
    var lit01 = -2f-1_      // EXPECTED: regex expected newline or ';' between expression or declaration
    var lit02 = 2_EE1_        // EXPECTED: regex exponent part donot has digits
    var lit03 = e2_
    var lit04 = 0x1.1_     // EXPECTED: regex hexadecimal float number must have exponent part
    var lit06 = 0x.2        // EXPECTED: regex hexadecimal float number must have exponent part
    var lit07 = 0xp2        // EXPECTED: regex hexadecimal number donot has digits

    if (lit03 != 100.0) {
        return 1
    }
    return 0
}
