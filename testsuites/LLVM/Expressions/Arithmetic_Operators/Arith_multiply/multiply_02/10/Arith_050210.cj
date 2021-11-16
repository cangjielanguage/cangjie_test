// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 63.9
    let b: Float32 = 255.9
    var ab = a * b  // EXPECTED: regex invalid binary operator '\*' on type 'Float16' and 'Float32'

    return 0
}
