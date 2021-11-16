// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var a : Int32 = 1
    var b : Float32 = 2.0
}

func run(): Int64 {
    var value1 : Data = Data()
    if (value1.a != 1 ) {
        return 1
    }
    if (value1.b != 2.0) {
        return 2
    }
    return 0 
}

func main(): Int64 {
    return run()
}
