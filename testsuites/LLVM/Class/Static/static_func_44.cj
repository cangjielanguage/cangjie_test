// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static func foo(x: Int32){ return x }
    static func coo(x: Int32): Int32{
        return foo(x)
    }
}

func run(): Int64 {
    if (Data.coo(2) != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
