// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32  = 2
}

let res = Test().a

func run(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

