// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    let a = 10
    let b = 20
    let c = 30

    var res = a > {b} ? a: { c >#b ? c: b}

    if res != 30 {
    return 1
    }

    return 0
}
