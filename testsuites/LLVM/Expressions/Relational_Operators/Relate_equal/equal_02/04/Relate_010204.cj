// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 10
    let b = 10.0

    if (a == b) {  // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Float64'
        return 1
    }
    return 0
}
