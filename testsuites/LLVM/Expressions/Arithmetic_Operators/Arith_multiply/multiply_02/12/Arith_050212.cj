// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int16 = 64
    let b: Float16 = 255.9
    let ab = a * b  // EXPECTED: regex invalid binary operator '\*' on type 'Int16' and 'Float16'

    return 0
}
