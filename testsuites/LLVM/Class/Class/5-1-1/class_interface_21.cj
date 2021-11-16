// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Basec {
    var one : Int32 = 1
}

interface Basei {
    func getNum() {
        return 1
    }
}

class Data <: Basec & Basei {
    var resc = one // EXPECTED: regex super member 'one' is not allowed to be used before calling super()
    var resi = getNum() // EXPECTED: regex 'getNum' is not allowed to be accessed before all member variables are initialized
}

func run(): Int64 {
    var value : Data = Data()
    if (value.resc != 1 || value.resi != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}