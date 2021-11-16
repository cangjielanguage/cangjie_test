// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 10
    var b: Int8 = 127
    if (b ^^ a) {  // EXPECTED: regex error
        return 1
    }
    return 0 
}
