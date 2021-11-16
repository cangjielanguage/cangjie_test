// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var a : Int32
    var b : Float32
    init()  {
        a = 200
        b = 300.0
    }

    init(data1 : Int32)  {
        a = data1
        b = 300.0
    }

    init(data1 : Int32, data2 : Float32)  {
        a = data1
        b = data2
    }
}

func run(): Int64 {
    var value1 : Data = Data()
    if (value1.a != 200 ) {
        return 1
    }

    if (value1.b != 300.0) {
        return 2
    }

    var value2 : Data = Data(400)
    if (value2.a != 400 ) {
        return 3
    }
    if (value2.b != 300.0) {
        return 4
    }

    var value3 : Data = Data(500, 600.0)
    if (value3.a != 500 ) {
        return 5
    }
    if (value3.b != 600.0) {
        return 6
    }
    return 0 
}

func main(): Int64 {
    return run()
}
