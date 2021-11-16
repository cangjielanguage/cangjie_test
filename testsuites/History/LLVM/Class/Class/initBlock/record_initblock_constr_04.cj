// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


record Data {
    var i1: Int32 = 2
    init {
        var a: Int32 = 1
        var b: String = "string"
        var c: Float32 = 3.1415926
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2 && data.a ==1 && data.b == "string" && data.c == 3.1415926) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
