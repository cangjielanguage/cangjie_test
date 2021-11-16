// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int16 = 10
    var b: Int64 = 2**31-1
    var c: Int8 = 0
    var d: Int8 = 0
    var e: Int64 = 2147483637
    d = a | b      // EXPECTED: regex invalid binary operator '|' on type 'Int16' and 'Int64'
    if (d != b) {  // EXPECTED: regex invalid binary operator '!=' on type 'Int8' and 'Int64'
        return 1
    }
    d = c | b      // EXPECTED: regex invalid binary operator '|' on type 'Int8' and 'Int64'
    if (d != b) {  // EXPECTED: regex invalid binary operator '!=' on type 'Int8' and 'Int64'
        return 1
    }
    return 0
}
