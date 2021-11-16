// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 32798
    let b = a - Int64(2147483649) // EXPECTED: regex invalid binary operator '\-' on type 'Int32' and 'Int64'

}
