// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped
open class I<T>{
    func test(a:T){return 1}
    func test(a:Int32){return 2}
}



func main():Int64{
    var res1 = I<Int16>().test(1) // EXPECTED: regex ambiguous match for function call
    return res1
}