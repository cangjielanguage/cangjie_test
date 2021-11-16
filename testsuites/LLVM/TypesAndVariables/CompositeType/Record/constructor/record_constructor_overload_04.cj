// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var tmp1: Int32 = 0
    var tmp2: Float64 = 0.0
    init() {}
    init(x: Int32) {}
    init(x: Int32, y: Int32) {}
    init(x: Int32, y: Float64) {
        tmp1 = x + 2
        tmp2 = y + 2.0
    }
}
var a: Int32 = 5
var b: Float64 = 6.0

let res = Test(a, b)
var res1 = res.tmp1
var res2 = res.tmp2

func run(): Int64 {
    if (res1 == 7 && res2 == 8.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
