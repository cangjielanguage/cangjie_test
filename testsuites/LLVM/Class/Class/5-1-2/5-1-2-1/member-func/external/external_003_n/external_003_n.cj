// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj %f -c 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto no matching function declaration for function call 'get'


package pkg1

func run(): Int64 {
    var data : Data = Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}
