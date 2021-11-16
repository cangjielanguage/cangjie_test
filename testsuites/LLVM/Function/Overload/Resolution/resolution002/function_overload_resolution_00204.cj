// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    func f(a: Int16) : Int64{return 1}
    func f(a: Int32) : Int64{return 2}
    func test(){
        this.f(1) // EXPECTED: regex ambiguous match for function call
    }
}

func main():Int64{
    return 0
}