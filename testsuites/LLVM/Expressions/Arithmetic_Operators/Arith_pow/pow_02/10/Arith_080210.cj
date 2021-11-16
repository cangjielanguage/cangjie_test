// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 2.5
    let b: Float32 = 11.6
    var ab = a ** b  // EXPECTED: regex invalid binary operator '\*\*' on type 'Float16' and 'Float32'

    return 0
}
