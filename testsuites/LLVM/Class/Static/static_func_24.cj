// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

class Data {
    static func coo<V>(x:V):V{
        return x
    }
}

func run(): Int64 {
    var res1: String  = Data.coo<String>("hi");
    if (res1 != "hi") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
