// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    var a : Int32 = 10
}

class Data <: Base {
    var b : Int32 = 1
    init() {
        super()
        b = 20
    }
}

func run(): Int64 {
    var value1 : Data = Data()
    if (value1.a != 10 ) {
        return 1
    }
    if (value1.b != 20 ) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}
