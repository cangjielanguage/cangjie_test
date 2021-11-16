// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32 = 1
    var b : Int32 = 2
    init() {
        a = 10
        b = 20
        print(a.toString()+"\n")
        print(b.toString()+"\n")
    }
    init(data1 : Int32) {
        this
    }
}

func run(): Int64 {
    var data: Data = Data(5)
    return 0
}

func main(): Int64 {
    return run()
}

