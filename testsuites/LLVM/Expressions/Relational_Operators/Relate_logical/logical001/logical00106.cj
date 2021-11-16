// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float16 = 1.2
    if (!a) {  // EXPECTED: regex invalid unary operator '!' on type 'Float16'
        return 1
    }
    return 0 
}
