// ERRCHECK: %compiler %cmp_opt %f -o %output
open class A{
    func i(a:Int64) {return 1}
}

class B <: A{
    func test():Int64 {
        super.i(return 0) // EXPECTED: regex argument type of nothing is not supported
    }
}

func main(): Int64 {
    return B().test()
}
