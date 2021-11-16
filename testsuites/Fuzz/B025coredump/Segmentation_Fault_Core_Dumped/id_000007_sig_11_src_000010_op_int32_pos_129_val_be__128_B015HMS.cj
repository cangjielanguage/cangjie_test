// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    let a: Float16 = 0xÿÿÿ + 0x7bdf
    let b: Float32 = 0x447fcccc + 0x477be0cc
    let c: Float64 = 0x408ff99980000000 + 0x40ef7c1999999999
    print(a.toString())
    print(b.toString())
    print(c.toString())

    if 65504.0 - a > 0.001{
        return 1
    }

    if 65504.0 - b > 0.01 {
        return 1
    }

    if 65504.0 - c > 0.01{
        return 1
    }

    return 0
}
