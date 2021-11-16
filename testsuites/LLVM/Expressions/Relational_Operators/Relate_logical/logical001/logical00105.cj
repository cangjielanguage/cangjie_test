// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int32 = 10
    if (!a) {  // EXPECTED: regex expected an expression of type 'Bool', but got 'Int32'
        return a
    }
    return 1 
}
