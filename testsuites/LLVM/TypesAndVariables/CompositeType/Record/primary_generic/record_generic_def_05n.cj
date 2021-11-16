// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data(T) {   // EXPECTED: regex expected '{' here
    let count: T

    Data(x: T){
        count = x
    }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data<Int64> = Data<Int64>(i)
    var res: Int64 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

