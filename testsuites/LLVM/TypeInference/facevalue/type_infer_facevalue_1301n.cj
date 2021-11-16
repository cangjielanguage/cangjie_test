// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var i2 = 3.0
    var flag1: Int64 = 3
    var res1 = i2 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Float64' and 'Int64'

    if (!res1) {
        return 1
    }
    return 0
}
