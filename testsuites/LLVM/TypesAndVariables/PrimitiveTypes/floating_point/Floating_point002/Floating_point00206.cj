// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float32 = 65505
    var b: Float64 = 65505
    if ((a - b) > 0.0001) { // EXPECTED: regex invalid binary operator '-' on type 'Float32' and 'Float64'
        return 1
    }
    return 0
}
