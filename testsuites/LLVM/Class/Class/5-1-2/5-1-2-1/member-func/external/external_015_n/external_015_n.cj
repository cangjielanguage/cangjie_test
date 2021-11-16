// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt -c pkg1.cj %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex overridden function 'get' should have 'open' modifier


package pkg1

class Data <: Base {
    override func get() : Int32 {
        return 2
    }
}

