// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int8 = 31
    let b: Int16 = 96

    var ab = a + b  // EXPECTED: regex invalid binary operator '\+' on type 'Int8' and 'Int16'

    return 0
}
