// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt -c  %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto no matching function declaration for function call 'get'


package pkg2
import pkg1.*

func run(): Int64 {
    var data : pkg1.Data = pkg1.Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}

