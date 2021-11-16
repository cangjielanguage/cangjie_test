// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var tmp: Int32 = 0
    init() {}
    init(x: Int32) {
       tmp = x + 1
    }
    init(x: Int32, y: Int32) {}
    init(x: Int32, y: Float64) {}
}

var a: Int32 = 2
let res = Test(a)
var res1 = res.tmp

func run(): Int64 {
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
