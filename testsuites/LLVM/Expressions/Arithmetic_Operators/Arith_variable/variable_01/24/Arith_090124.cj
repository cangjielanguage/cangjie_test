// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 6
    let b: Int64 = 16
    let c = b ** a  // EXPECTED: regex invalid binary operator '\*\*' on type 'Int64' and 'Int32'

    return 0
}
