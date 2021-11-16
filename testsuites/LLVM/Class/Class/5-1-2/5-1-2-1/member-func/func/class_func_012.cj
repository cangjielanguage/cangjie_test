// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex do not need 'override' modifier for function 'getA'


abstract class BaseA {
    func getA() : Int32
}

class Data <: BaseA {
    override func getA() : Int32 {
        return 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
