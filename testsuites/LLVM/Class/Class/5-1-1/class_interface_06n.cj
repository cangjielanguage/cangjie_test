// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto illegal inheritance with same identifier 'Data'

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

class Data <: Base  & Data implements Base1 {
    var res = getNum()
    var res1 = getNum1()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
