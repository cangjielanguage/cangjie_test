// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex-auto class 'BaseB' missing abstract modifier or abstract function 'getA' should be implemented
// ASSERT: regex-auto class 'BaseB' missing abstract modifier or abstract function 'getB' should be implemented


abstract class BaseA {
    func getA() : Int32
    func getB() : Int32
}

class BaseB <: BaseA {

}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
