// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

class Data {
    static let a: Int32 = 1
    init() {}
    init(x:Int32){
        this()
        a = x    // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
    func foo():Int32{
        return a
    }

}

func run(): Int64 {
    var res1 : Int32 = Data.a
    var res2 : Int32 = Data().foo()
    var res3 : Int32 = Data(5).foo()
    if (res1 != 1 || res2 != 1 || res3 != 5) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
