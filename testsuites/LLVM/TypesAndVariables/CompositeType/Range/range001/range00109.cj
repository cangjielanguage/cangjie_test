// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex step cannot be zero in range expression

func main(): Int64 {
    let a = ..:1
    let b = ..:-1
    let c  = ..:0
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
