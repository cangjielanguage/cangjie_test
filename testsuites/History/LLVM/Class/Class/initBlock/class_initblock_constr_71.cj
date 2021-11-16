// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base{
    init{
        var base: Int32 = 4
    }
}

class Data <: Base {
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c: Int32 = 2
    }
    init(m: String){
        init(100,m)
    }
}

func run(): Int64 {
    var data : Data = Data("hello")
    if (data.base == 4 && data.a == 100 && data.b == "hello" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
