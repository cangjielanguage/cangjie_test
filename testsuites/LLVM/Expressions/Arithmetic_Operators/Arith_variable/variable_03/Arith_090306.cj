// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f


func main(): Int64 {
    let a: UInt16 = 32767
    let b = a + UInt32(65536)// EXPECTED: regex invalid binary operator '\+' on type 'UInt16' and 'UInt32'

    return 0
}