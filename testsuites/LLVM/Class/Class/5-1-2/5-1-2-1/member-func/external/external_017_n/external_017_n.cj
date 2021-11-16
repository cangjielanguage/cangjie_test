// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt -c  %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace



package pkg2
import pkg1.*

class Data <: pkg1.Base {
    override func get() : Int32 {
        return 2
    }
}

