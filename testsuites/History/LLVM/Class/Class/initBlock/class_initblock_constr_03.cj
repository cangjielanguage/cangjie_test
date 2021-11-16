// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var i1: Int32 = 2
    init {
        var a: Int32
        var b: String
        var c: Float32
    }
}

func run(): Int64 {
    var data : Data = Data(1, "string", 3.1415926)
    if (data.i1 == 2 && data.a ==1 && data.b == "string" && data.c == 3.1415926) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
