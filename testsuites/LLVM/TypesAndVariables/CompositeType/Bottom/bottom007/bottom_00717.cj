// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto there is no non-parameter constructor in super class

open class A{
    init(a:Int64){}
}

class B <: A{
    func test():Int64 {
        super(return 0)
        return 1
    }
}

func main(): Int64 {
    return B().test()
}
