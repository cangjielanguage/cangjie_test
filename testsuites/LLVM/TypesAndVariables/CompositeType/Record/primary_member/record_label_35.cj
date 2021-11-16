// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1 {
    var a: Int32  = 2
}

record Test2 {
    var b: Int32 = Test1().a
}

let res = Test2().b

func run(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

