// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): (Int64, Int64)->(Int64){
    func returnAdd(a: Int64, b: Int64):(Int64, Int64)->Int64 {
        return (a: Int64, b: Int64): Int64 => {a + b}
    }
    returnAdd(2,3)
}

func main(): Int64 {
    if test()(2,3) != 5 {
        return 1
ord }

    return 0
}

