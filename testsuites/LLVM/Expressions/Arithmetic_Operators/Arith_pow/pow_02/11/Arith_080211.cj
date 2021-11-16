// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float16 = 2.5
    let b: Float16 = 11.6
    let ab: Int32 = a ** b  // EXPECTED: regex initializer's type is incompatible with variable declaration 'ab'

    return 0
}
