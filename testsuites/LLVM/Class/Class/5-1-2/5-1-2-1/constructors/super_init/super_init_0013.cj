// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    var a : Int32
    var b : Float32
    init(value1 : Int32, value2 : Float32) {
        a = value1 
        b = value2
    }
}

class Data <: Base {
    var c : Int32 = 1
    var d : Int32 = 2
    var e : Int32 = 3

    init(value1 : Int32, value2 : Int32) {
        super(300, 30.0)
        c = value1
        d = value2
    }

    init(value1 : Int32) {
        this(value1, 4)
    }

    init() {
        this(3)
        e = 5
    }
}


func run(): Int64 {
    var value1 : Data = Data()
    if (value1.a != 300 ) {
        return 1
    }
    if (value1.b != 30.0 ) {
        return 2
    }
    if (value1.c != 3) {
        return 3
    }
    if (value1.d != 4) {
        return 4
    }
    if (value1.e != 5) {
        return 5
    }
    return 0
}

func main(): Int64 {
    return run()
}
