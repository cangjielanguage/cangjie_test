// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test1 {
    let a: Int32  = 0
    var b: Int32  = 0
    init( a: Int32, b: Int32) {
        this.a = a     // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        this.b = b
    }
}

record Test2 {
    func foo(): Int32 {
       let test = Test1(2, 2)
       return test.a + test.b
    }
}

let res = Test2().foo()

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

