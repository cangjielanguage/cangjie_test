// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class ClassData {
    let i: Int32 = 2
    type CD = ClassData // EXPECTED: regex type must be declared on toplevel
}

func main(): Int64 {
    var cd1: CD = ClassData()
    var cd2: ClassData = ClassData()
    if (cd1.i == cd2.i) {
        return 0
    }
    return 1
}