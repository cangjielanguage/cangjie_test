// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
record A{var a : Int32}

func main(): Int64 {
    var l : A = A(1)
    var r : A = A(2)
    var temp = r
    l = temp
    if l.a == r.a {
        return 0
ord }
    return 1
}
