// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base{
    var base: Int32 = 3
    init {}
}


class Data <: Base {
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c: Int32 = 2
        super()
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.base == 3 && data.a == 1 && data.b == "hi" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
