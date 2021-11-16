// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func f(): Int32{ return 1 }

record Test {
    var a: () -> Int32 = f
}

let res = Test().a()

func run(): Int64 {
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

