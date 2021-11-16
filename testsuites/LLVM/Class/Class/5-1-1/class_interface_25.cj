// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
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

interface Basei1 {
    func getNum1() {
        return 2
    }
}

interface Basei2 {
    func getNum2() {
        return 3
    }
}

class Data <: Basec & Basei  & Basei1  & Basei2 {
    var resc = one      // EXPECTED: regex super member 'one' is not allowed to be used before calling super()
    var resi = getNum() // EXPECTED: regex 'getNum' is not allowed to be accessed before all member variables are initialized
    var resi1 = getNum1() // EXPECTED: regex 'getNum1' is not allowed to be accessed before all member variables are initialized
    var resi2 = getNum2() // EXPECTED: regex 'getNum2' is not allowed to be accessed before all member variables are initialized
}

func run(): Int64 {
    var value : Data = Data()
    if (value.resc != 1 || value.resi != 1 || value.resi1 != 2 || value.resi2 != 3) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}