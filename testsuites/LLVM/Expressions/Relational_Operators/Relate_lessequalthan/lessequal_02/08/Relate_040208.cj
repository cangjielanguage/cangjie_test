// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 1023.2
    let b: Float32 = 1023.2

    if (a <= b) {  // EXPECTED: regex invalid binary operator '<=' on type 'Float16' and 'Float32'
        return 1
    }
    return 0
}
