// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data(T) {   // EXPECTED: regex expected '{' in class
    let count: T

    init(x: T){
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

