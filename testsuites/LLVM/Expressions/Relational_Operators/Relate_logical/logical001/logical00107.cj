// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: String = "cc"
    if (!a) {  // EXPECTED: regex invalid unary operator '!' on type 'Record-String'
        return 1
    }
    return 0 
}
