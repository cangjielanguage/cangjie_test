// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


record Data {
    var i1: Int32 = 2
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
