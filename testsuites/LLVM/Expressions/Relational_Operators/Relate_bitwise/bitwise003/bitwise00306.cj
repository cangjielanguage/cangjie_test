// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a:Int16 = 10
    var b:Int64 = 9223372036854775808
    var c:Int8 = 0
    var d:Int8 = 0
    d = a & b   // EXPECTED: regex invalid binary operator '&' on type 'Int16' and 'Int64'
    if (d != c) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0
}
