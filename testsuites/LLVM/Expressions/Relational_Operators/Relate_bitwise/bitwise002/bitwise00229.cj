// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 8
    var b: Bool = true
    a = 12 << b  // EXPECTED: regex invalid binary operator '<<' on type 'Int8' and 'Bool'
    a = 12 >> b  // EXPECTED: regex invalid binary operator '>>' on type 'Int8' and 'Bool'
    return 0 
}
