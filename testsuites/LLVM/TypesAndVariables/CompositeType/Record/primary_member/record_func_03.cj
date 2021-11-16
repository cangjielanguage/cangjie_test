// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1 {
    var a: Int32  = 0
    var b: Int32  = 0
    Test1( a: Int32, b: Int32) {
        this.a = a
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

