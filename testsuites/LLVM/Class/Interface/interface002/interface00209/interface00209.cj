// DEPENDENCE: interface00209a cfg-ast
// EXEC: %compiler %cmp_opt -c interface00209a/interface00209a.cj -o interface00209a.%middle
// EXEC: %compiler %cmp_opt -c %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex undeclared type name 'MyInterface'

import interface00209a.*

interface A <: interface00209a.MyInterface{}

class B <: A{}
    func main() : Int64 {
    var a = B()
    return 0
}

