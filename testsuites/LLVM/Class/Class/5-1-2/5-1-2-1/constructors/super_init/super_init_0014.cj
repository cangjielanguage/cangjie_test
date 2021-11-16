// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    var a : Int32
    init() {
        a = 10 
    }
}

class Data <: Base {
    var b : Int32 = 20
    init() {
        super()
        b = 2
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 10 ) {
        return 1
    }
    if (value.b != 2 ) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}
