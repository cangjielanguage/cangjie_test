// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 =  15.6 ** 5 // EXPECTED: regex invalid binary operator '\*\*' on type 'Float16' and 'Int'
    return 0
}