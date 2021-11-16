// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int16 = 2020 + 0.1 // EXPECTED: regex invalid binary operator '\+' on type 'Int' and 'Float'

    return 0
}
