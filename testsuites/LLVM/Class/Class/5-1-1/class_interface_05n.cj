// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected '{' in class

interface Base {
    func getNum() {
        return 1
    }
}

interface Base1 {
    func getNum1() {
        return 1
    }
}

class Data <: Base  & implements Base1 {
    var res = getNum()
    var res1 = getNum1()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
