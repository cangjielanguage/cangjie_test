// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    open func f(a: Int16) : Int64{return 1}
}

class B <: A{
    func f(a: Int32) : Int64{return 2}
}

func main():Int64{
    B().f(1) // EXPECTED: regex ambiguous match for function call
    return 1
}