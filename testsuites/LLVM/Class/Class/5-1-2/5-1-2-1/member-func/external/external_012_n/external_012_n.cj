// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj %f -c 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex need 'override' modifier for function 'get'


package pkg1

class Data <: Base {
    func get() : Int32 {
        return 2
    }
}

