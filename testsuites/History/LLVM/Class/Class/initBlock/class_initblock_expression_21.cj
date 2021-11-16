// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    init {
        let i1: Int32 = 2
        let i2: Int32 = i1
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2 && data.i2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
