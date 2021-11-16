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
    func getVol<V>(x: V): V{
        return x
    }
}

record Test3 {
    let i: Int32 = 2
    let test1: Test1<Int32> = Test1<Int32>(i)
    let width: Int32 = test1.width
    let i2: Int32 = 4
    let test2: Test2<Int32> = Test2<Int32>(i2)
    let test2_1: Test2<Int32> = test1.getTest2<Test2<Int32>>(test2)
    let area: Int32 = test2_1.area
    let i3: Int32 = 6
    let vol: Int32 = test2_1.getVol<Int32>(i3)
}

func run(): Int64 {
    let res1: Int32 = Test3().width
    let res2: Int32 = Test3().area
    let res3: Int32 = Test3().vol
    if ( res1 == 2 && res2 == 4 && res3 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}