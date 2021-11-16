// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    init()  {
        var a : Int32 = 1
        this.a = 200
        a = 400
    }
    var a : Int32
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a == 200 ) {
        return 0
    }
    else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
