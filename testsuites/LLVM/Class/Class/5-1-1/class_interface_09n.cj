// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected type

interface Base {
    func getNum() {
        return 1
    }
}

class Data <: {
    var res = getNum()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
