// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1<T> {
    let width: T
    init(x: T){
        width = x
    }
    func area<V>(x: V): V{
        return x
    }
}

record Test2 {
    var i: Int32 = 2
    let test1: Test1<Int32> = Test1<Int32>(i)
    let width: Int32 = test1.width
    var i2: Int32 = 3
    let area: Int32 = test1.area<Int32>(i2)
}

func run(): Int64 {
    let res1: Int32 = Test2().width
    let res2: Int32 = Test2().area
    if ( res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
