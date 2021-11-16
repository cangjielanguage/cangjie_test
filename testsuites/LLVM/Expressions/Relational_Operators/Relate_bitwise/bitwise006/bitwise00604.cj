// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int32 = 10
    var b: Int32 = 127
    if (a != b & a) { // EXPECTED: regex invalid binary operator '&' on type 'Bool' and 'Int32'
        return 1
    }
    return 0
}
