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

class Data <: Basec & Basei <: Basei1 {
    var resc = one
    var resi = getNum()
    var resi1 = getNum1()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
