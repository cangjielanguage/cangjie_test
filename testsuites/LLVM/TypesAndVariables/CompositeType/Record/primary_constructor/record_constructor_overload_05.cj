// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    Test(var a: Int32, var b: Int32) {}
    init(x: Int32, y: Float64) {
        a = x + 1
        b = Int32(y + 2.0)
    }
}

var a: Int32 = 5
var b: Int32 = 6
let res = Test(a, b)
var res1 = res.a
var res2 = res.b

func run(): Int64 {
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
