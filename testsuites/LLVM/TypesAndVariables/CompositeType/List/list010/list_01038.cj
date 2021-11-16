// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


open class A {}

class B <: A{
    func test(): Int64 {
        var a = [super] // EXPECTED: regex invalid super expression, it can only be used on the left-hand side of a dot
        return a.size() - 1
    }
}

func main(): Int64 {
    return B().test()
}
