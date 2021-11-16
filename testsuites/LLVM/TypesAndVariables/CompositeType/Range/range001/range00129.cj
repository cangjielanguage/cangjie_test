// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression


func main(): Int64 {
    let a = Float64(1)..Float64(10):Float64(1)
    let b : Float64 = 1
    let b1 = b..b:b
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
