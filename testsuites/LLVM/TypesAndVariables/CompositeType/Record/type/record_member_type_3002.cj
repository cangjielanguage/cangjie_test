// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1<T> {
    let a: T
    init(x: T){
        a = x
    }
}

record Test2 {
    let recTest1: Test1<Int32>
    init(x: Test1<Int32>) {
        recTest1 = x
    }
}


func run(): Int64 {
    var i: Int32 = 5
    var test1: Test1<Int32> = Test1<Int32>(i)
    let recTest1: Test1<Int32> = Test2(test1).recTest1
    var res: Int32 = recTest1.a
    if (res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}