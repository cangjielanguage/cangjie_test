// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args


class Data {
    var a : Int32 = 1
    var b : Float32 = 2.0
    init() {}
    init(data1 : Int32) {
        a = data1;
        b = 1.0
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 1 ) {
        return 1
    }
    if (value.b != 2.0) {
        return 2
    }
    return 0 
}

func main(): Int64 {
    return run()
}
