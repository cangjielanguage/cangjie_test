// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected '<:' to inherit or '{' to open a scope

interface Base {
    func getNum() {
        return 1
    }
}

class Data implement Base {
    var res = getNum()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
