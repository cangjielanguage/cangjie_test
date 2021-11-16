// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var i1: Int32 = 2
    init {
        var a: Int32
        var b: String = "string"
        var c: Float32 = 3.1415926
    }
}

func run(): Int64 {
    var data : Data = Data(3, c:2.59)
    if (data.i1 == 2 && data.a == 3 && data.b == "string" && data.c == 2.59) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
