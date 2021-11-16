// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var a : Int32 = 1
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
