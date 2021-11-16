// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt pkg1.cj %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex no matching function declaration for function call


package pkg1

func run(): Int64 {
    var data : Data = Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}
