// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface Base {
    func getNum() {
        return 1
    }
}

interface Base1 {
    func getNum1() {
        return 2
    }
}

class Data <: Base  & Base1 {
    var res = getNum() // EXPECTED: regex 'getNum' is not allowed to be accessed before all member variables are initialized
    var res1 = getNum1() // EXPECTED: regex  'getNum1' is not allowed to be accessed before all member variables are initialized
}

func run(): Int64 {
    var value : Data = Data()
    if ( value.res != 1 || value.res1 != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}