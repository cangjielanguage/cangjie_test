// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    var a: Int32
    var b: Int32
    init(x:Int32, y:Int32) {
        a = x
        b = y
    }
    func foo() {
        a += b
        return a
    }
    static func bar(): Int32 {
        var i:Int32 = 3
        i /=3
        i
    }
}

func main(): Int64 {
    var data = Data(2,2)
    data.a += data.b
    data.b -= data.foo()+Data.bar()
    if (data.a == 6 && data.b == -5) {
        return 0
    }
    return 1
}