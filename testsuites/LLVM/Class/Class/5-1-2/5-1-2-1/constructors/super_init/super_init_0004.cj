// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    var a : Int32 = 100
    var b : Float32  = 10.0
}

class Data <: Base {
    var c : Int32 = 1
    init() {
        c = a + 200
    }
}

func run(): Int64 {
    var value1 : Data = Data()
    if (value1.a != 100 ) {
        return 1
    }
    if (value1.b != 10.0 ) {
        return 2
    }
    if (value1.c != 300 ) {
        return 3
    }
    return 0
}

func main(): Int64 {
    return run()
}
