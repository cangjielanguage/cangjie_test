// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data{
    static let a = 1
    var b = 2
return }    // EXPECTED: regex illegal class member in class block

func main(): Int64 {
    Data.a
    return 0
}
