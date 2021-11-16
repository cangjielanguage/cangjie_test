// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
    static func coo(x: T):T{
        return x
    }
}
class Test<T> <: I<T>{}

func run(): Int64 {
    var res1: String  = Test<String>.coo("hi");
    if (res1 != "hi") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
