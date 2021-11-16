// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 8
    var r: Float32 = 1.206
    a = 12 << r  // EXPECTED: regex invalid binary operator '<<' on type 'Int8' and 'Float32'
    a = 12 >> r  // EXPECTED: regex invalid binary operator '>>' on type 'Int8' and 'Float32'
    return 0
}
