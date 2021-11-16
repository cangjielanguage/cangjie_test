// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let a = (1,1)[1]...(10,10)[0]:(1,1)[1]
ord //let a = (1,1)...(2,2):(1,1)
    return 0
}
