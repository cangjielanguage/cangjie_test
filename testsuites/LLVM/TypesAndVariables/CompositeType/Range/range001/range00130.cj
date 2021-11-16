// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression


func main(): Int64 {
    let a = '1'..'2':'1'
    let b : Char = '1'
    let b1 = b..b:b
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
