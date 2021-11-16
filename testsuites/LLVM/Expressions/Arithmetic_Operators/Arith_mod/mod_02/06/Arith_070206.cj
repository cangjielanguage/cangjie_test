// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int8 = 32
    let b: Int16 = 96
    var c = b % a   // EXPECTED: regex invalid binary operator '%' on type 'Int16' and 'Int8'

    return 0
}
