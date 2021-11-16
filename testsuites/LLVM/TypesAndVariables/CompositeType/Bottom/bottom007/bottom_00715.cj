// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    func i(a:Int64) {return 1}
    func test():Int64 {
        this.i(return 0) // EXPECTED: regex argument type of nothing is not supported
    }
}

func main(): Int64 {
    return A().test()
}
