// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  expected newline or ';' between expression or declaration

func main(): Int64 {

    let a = 9
    let b = 10
    let c = 8

    a < b > c

    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
