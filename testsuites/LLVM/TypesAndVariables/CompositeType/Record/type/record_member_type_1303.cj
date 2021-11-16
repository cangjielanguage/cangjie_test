// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1<T> {
    let width: T
    init(x: T){
        width = x
    }
    func getTest2<V>(x: V): V{
        return x
    }
}

record Test2<T> {
    let area: T
    init(x: T){
        area = x
    }
}

record Test3 {
    var i: Int32 = 2
    let test1: Test1<Int32> = Test1<Int32>(i)
    let width: Int32 = test1.width
    var i2: Int32 = 4
    var test2: Test2<Int32> = Test2<Int32>(i2)
    let test2_1: Test2<Int32> = test1.getTest2<Test2<Int32>>(test2)
    let area: Int32 = test2_1.area
}

func run(): Int64 {
    let res1: Int32 = Test3().width
    let res2: Int32 = Test3().area
    if ( res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}