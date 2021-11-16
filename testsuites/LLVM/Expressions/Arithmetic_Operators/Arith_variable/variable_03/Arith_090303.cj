// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int16 = 6666
    let b = a + Int32(32768) // EXPECTED: regex invalid binary operator '\+' on type 'Int16' and 'Int32'

    return 0
}