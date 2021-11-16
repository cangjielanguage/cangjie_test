// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    var a : Int32
    var b : Float32
    init()  {
        a = 100
        b = 10.0
    }
    
    init(data1 : Int32)  {
        a = data1
        b = 200.0
    }

    init(data1 : Int32, data2 : Float32)  {
        a = data1
        b = data2
    }
}

class Data <: Base {
    var c : Int32 = 1
    var d : Int32 = 2
    init(value : Int32) {
        c = value
    }
    init() {
        this(3)
        d = super.a + 1
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 100 ) {
        return 1
    }
    if (value.b != 10.0 ) {
        return 2
    }
    if (value.c != 3) {
        return 3
    }
    if (value.d != 101) {
        return 4
    }
    return 0
}

func main(): Int64 {
    return run()
}
