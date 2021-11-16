// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data<> { // EXPECTED: regex expected identifier here
    let count: T
    init(x: T){
        count = x
    }
}

func main(): Int64 {
    let data: Data<Int64> = Data<Int64>(i)
    return 0
}

