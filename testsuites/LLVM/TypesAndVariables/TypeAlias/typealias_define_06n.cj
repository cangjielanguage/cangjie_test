// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


type Int = Int32
type Int = Int64    // EXPECTED: regex redefinition of declaration 'Int'

func main(): Int64 {
    var i1: Int64 = 1
    var i2: Int = 2
    var res: Int = i1 + i2
    if (res == 3) {
        return 0
    }
    return 1
}