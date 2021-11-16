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

class Data <: Basei <: Basec {
    var resc = one
    var resi = getNum()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
