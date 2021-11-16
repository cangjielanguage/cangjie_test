// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data T> {  // EXPECTED: regex expected '{' here
    let count: T

    Data(x: T){
        count = x
    }
}

func main(): Int64 {
    var i: Int32 = 2
    let data: Data<Int64> = Data<Int64>(i)
    return 0
}

