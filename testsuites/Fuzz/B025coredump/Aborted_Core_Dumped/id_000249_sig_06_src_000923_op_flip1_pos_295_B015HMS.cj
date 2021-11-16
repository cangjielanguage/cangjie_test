// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let a = bigInt(1)...bigInt(10):bigInt(1)
    let b = bigInt(1)...10:1
    let c = 1...bigInt(10):1
    let d = 1...10:bigInt(1)
    let e : bigInt = 1
    let e1 = e...e:e
    let e2 = e...1*1
    let e3 = 1...e:1
    let e4 = 1...1:e
    return 0
}
