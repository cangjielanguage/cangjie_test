// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {

    let a: UInt8 = 254 - 255 // EXPECTED: regex error.*overflow in 'Subtraction' calculation

    return 0
}
