// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 10.0
    let b: Char = 'A'

    if (a <= b) {  // EXPECTED: regex invalid binary operator '<=' on type 'Float16' and 'Char'
        return 1
    }
    return 0
}
