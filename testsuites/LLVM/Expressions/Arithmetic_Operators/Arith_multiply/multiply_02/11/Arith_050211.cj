// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 63.9
    let b: Float16 = 255.9
    let ab: Int32 = a * b  // EXPECTED: regex initializer's type is incompatible with variable declaration 'ab'

    return 0
}
