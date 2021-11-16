// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data<_@1> {  // EXPECTED: regex expected identifier here
    let count: _@1

    init(x: _@1){
        count = x
    }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data<Int64> = Data<Int64>(i)
    return 0
}

func main(): Int64 {
    return run()
}

