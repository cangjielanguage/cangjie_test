// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    let b: Int32 =2
    static func coo(x: Int32): Int32{
        return x + b
    }
}

func run(): Int64 {
    if I.coo(2) != 4 {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
