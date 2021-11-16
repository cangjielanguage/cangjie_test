// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let a: T
    init(x: T){
        a = x
    }
}

class Test {
    let data1: Data<Int32> = Data<Int32>(2)
    let data2: Data<Int32>
    init(x: Data<Int32>){
        data2 = x
    }
    func f(x: Data<Int32>): Data<Int32>{
        return x
    }
}

func run(): Int64 {
    var d1: Data<Int32> = Data<Int32>(3)
    var d2: Data<Int32> = Data<Int32>(4)
    var test: Test = Test(d1)
    let res1: Data<Int32> = test.data1
    let res2: Data<Int32> = test.data2
    let res3: Data<Int32> = test.f(d2)
    if ( res1.a == 2 && res2.a == 3 && res3.a == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
