// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


record Data {
    var data1: Int32 = 4
    private init{
        var data2: Int32 = 3
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.data1 == 4 && data.data2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
