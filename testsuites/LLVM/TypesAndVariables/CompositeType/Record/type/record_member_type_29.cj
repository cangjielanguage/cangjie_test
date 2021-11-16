// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo(): Int32{ return 1 }

record Test {
    let a: () -> Int32
    init(x: () -> Int32) {
        a = x
    }
}

let res = Test(foo).a()

func run(): Int64 {
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}