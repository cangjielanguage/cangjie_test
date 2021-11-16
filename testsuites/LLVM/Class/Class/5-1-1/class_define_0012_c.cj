// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {

}

func run(): Int64 {
    var d:Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}

