// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I {
    static func foo(x: Int32){ return x }
}

class Data <: I {
    var b: Int32 = foo(2)
}

func run(): Int64 {
    var data: Data = Data()
    if (data.b != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

