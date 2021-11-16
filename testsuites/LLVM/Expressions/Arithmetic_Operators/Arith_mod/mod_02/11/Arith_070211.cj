// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 65503.2
    let b: Float16 = 255.32
    let c: Int32 = a % b  // EXPECTED: regex invalid binary operator '%' on type 'Float16' and 'Float16'

    return 0
}
