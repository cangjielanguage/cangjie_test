// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Float32*String
    init(x: Float32*String) {
        a = x
    }
}
let res: Test = Test((3.14, "PIE"))
var res1 = res.a

func run(): Int64 {
    if (res1[0] == 3.14 && res1[1] == "PIE") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
