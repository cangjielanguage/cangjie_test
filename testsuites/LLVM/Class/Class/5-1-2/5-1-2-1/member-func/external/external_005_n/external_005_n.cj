// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt -c  %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex no matching function declaration for function call


package pkg2
import pkg1.*

func run(): Unit {
    var data : pkg1.Data = pkg1.Data()
    var a : Int32 = data.get()
}
