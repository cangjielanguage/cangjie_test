// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int8 = 10
    let b: Char = 'A'

    if (a >= b) {  // EXPECTED: regex invalid binary operator '>=' on type 'Int8' and 'Char'
        return 1
    }

    return 0
}
