// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1
    var b: Int32 = a
}

let res: Int32 = Test().b

func run(): Int64 {
    if (res == 1) {
        return 0
    }
    return Int64(res)
}

func main(): Int64 {
    return Int64(run())
}
