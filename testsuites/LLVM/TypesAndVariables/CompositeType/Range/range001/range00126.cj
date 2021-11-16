// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression

func main(): Int64 {
    let a = Float16(1)..Float16(10):Float16(1)
    let b : Float16 = 1
    let b1 = b..b:b
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
