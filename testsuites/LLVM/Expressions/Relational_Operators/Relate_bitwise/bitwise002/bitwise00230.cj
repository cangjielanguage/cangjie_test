// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 8
    var b: Unit = ()
    a = 12 << b  // EXPECTED: regex invalid binary operator '<<' on type 'Int8' and 'Unit'
    a = 12 >> b  // EXPECTED: regex invalid binary operator '>>' on type 'Int8' and 'Unit'
    return 0
}
