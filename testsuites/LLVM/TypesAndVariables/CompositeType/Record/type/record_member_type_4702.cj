// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1<T> {
    let a: T
    init(x: T){
        a = x
    }
}

record Test2 {
    func f(x: Test1<Int32>): Test1<Int32> { return x}
}

func run(): Int64 {
    var i: Int32 = 2
    let res = Test2().f(Test1<Int32>(i))
    let res1 = res.a
    if (res1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}