// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped


func main(): Int64 {
    let a = ..
    let b = 0
    return b
}
