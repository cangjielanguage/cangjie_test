// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1
    var b: Int32 = 2
    init( a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
    init(a1: Int32) {
        a = a1
    }
}

let res = Test(2, 4)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

