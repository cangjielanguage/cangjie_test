// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32
    var b: Int32
    Test(x: Int32, y: Float64) {
        a = x + 1
        b = Int32(y + 2.0)
    }
}

var a: Int32 = 5
var b: Float64 = 6.0
let res = Test(a, b)
var res1 = res.a
var res2 = res.b

func run(): Int64 {
    if (res1 == 6 && res2 == 8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
