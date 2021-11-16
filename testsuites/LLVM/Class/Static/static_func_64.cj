// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static func foo(x: Int32){ return x }
    var b: Int32
    // init {}
    init(){
        b = foo(2)
    }
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
