// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 0
    a = Int8(10) + 1.1  // EXPECTED: regex-auto invalid binary operator '+' on type 'Int8' and 'Float'

    if (a == 11.1) {
        return 0
    }
    return 1
}
