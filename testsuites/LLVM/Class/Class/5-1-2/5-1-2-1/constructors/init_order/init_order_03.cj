// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var a : Int32
    var b : Float32
    init()  {
        a = 200
        b = 300.0
    }
}

func run(): Int64 {
    var value : Data = Data()
    if((value.a == 200) && (value.b == 300.0)){
        return 0
    }
    else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
