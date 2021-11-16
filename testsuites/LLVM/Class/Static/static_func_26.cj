// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    static func coo(x: T):T{
        return x
    }
}

func run(): Int64 {
    var res1: String  = Data<String>.coo("hi");
    if (res1 != "hi") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
