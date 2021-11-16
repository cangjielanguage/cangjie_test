// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float16 = 65503.56
    var b: Float32 = 65503.56
    if ((a - b) > 0.0001) { // EXPECTED: regex invalid binary operator '-' on type 'Float16' and 'Float32'
        return 1
    }
    return 0
}
