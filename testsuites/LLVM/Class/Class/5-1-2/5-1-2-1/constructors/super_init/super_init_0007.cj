// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args


open class Base {
    var a: Int32
  var b: Float32
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
    var e : Int32 = 3
    init(value1 : Int32, value2 : Int32, value3 : Int32) {
        c = value1
      d = value2
        e = value3
    }
    init(value1 : Int32, value2 : Int32) {
        this(value1, value2, 30)
    }
    init(value1 : Int32) {
        this(value1, 20)
    }
    init() {
        this(10)
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
    if (value1.c != 10) {
        return 3
    }
    if (value1.d != 20) {
        return 4
    }
    if (value1.e != 30) {
        return 5
    }
    return 0
}

func main(): Int64 {
    return run()
}
