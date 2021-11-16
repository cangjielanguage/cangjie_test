// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float32 = 0
    var b: Float16 = 1.5
    if ((a - b) > 0.0001) { // EXPECTED: regex invalid binary operator '-' on type 'Float32' and 'Float16'
        return 1
    }
    return 0
}
