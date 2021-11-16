// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

open class Basec {
    var one : Int32 = 1
}

open class Basec1 {
    var two : Int32 = 2
}

interface Basei {
    func getNum() {
        return 1
    }
}

class Data <: Basec & Basec1 & Basei { // EXPECTED: regex-auto only one super class may appear in supertype list of class 'Data'
    var resc = one
    var resc1 = two
    var resi = getNum()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
