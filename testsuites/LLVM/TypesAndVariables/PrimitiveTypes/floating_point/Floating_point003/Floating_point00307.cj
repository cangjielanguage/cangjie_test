// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float32 = Not a Number  // EXPECTED: regex undeclared identifier 'Not'
    var b: Float32 = Not a Number  // EXPECTED: regex undeclared identifier 'Not'
    if (a - b > 0.0001) {
        return 1
    }
    return 0
}
