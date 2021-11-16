// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float16 = Float16  // EXPECTED: regex expected expression here
    var b: Float16 = 1.5
    if ((a - b) > 0.0001) {
        return 1
    }
    return 0
}
