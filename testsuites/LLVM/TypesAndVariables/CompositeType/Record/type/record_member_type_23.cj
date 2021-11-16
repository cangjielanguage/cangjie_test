// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: String
    init(x: String) {
        a = x
    }
}

let res = Test("hello")
let res1 = res.a

func run(): Int64 {
    if (res1 == "hello") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
