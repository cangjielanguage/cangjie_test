// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected '{' in class

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

class Data <: Basec & Basei Basei1 Basei2 {
    var resc = one
    var resi = getNum()
    var resi1 = getNum1()
    var resi2 = getNum2()
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
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
