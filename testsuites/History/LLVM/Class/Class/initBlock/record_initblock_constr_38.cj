// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


record Data {
    var i1: Int32 = 2
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c:Int32 = 2
    }
    init(m: String) {
        init(100)
    }
}

func run(): Int64 {
    var data : Data = Data("yes")
    if (data.i1 == 2 && data.a == 100 && data.b == "hi" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
