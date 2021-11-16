// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var a : Int32  = 100
    var b : Float32
    init()  {
        b = 3.0
    }
}

func run(): Int64 {
    var value : Data = Data();
    if ((value.a == 100) && (value.b == 3.0)) {
        return 0
    }
    else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
