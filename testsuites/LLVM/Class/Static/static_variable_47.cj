// EXEC: %compiler %cmp_opt %n.cj -o %output

open class Base {
    static let a: Int32 = 2

}

class Data <: Base {
    var b: Int32 = 0
    init() {}
    init(x: Int32) {
        this()
        b = Base.a + x
    }
}

func run(): Int64 {
    var data: Data = Data(1)
    if (Base.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
