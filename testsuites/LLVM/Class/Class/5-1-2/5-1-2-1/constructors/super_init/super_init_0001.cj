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
    init() {
        c = super.a + 300
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
    if (value.c != 400 ) {
        return 3
    }
    return 0
}

func main(): Int64 {
    return run()
}
