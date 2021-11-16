// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    static func foo(x: Int32){ return x }
    func coo(){
        return foo(2)
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.coo() != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
