// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var tmp: Int32 = 0
    init() {}
    init(x: Int32) {}
    init(x: Int32, y: Int32) {
        tmp = x + y
    }
    Test(x: Int32, y: Float64) {}
}

var a: Int32 = 5
var b: Int32 = 6
let res = Test(a, b)
var res1 = res.tmp

func run(): Int64 {
    if (res1 == 11) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
