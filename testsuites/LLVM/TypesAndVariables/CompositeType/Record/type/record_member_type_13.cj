// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1 {
    let width:Int32
    init(x: Int32){
        width = x
    }
    func area(x: Int32): Int32{
        return x
    }
}

record Test2 {
    var i: Int32 = 2
    var test1: Test1 = Test1(i)
    var width: Int32 = test1.width
    var i2: Int32 = 3
    var area: Int32 = test1.area(i2)
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
