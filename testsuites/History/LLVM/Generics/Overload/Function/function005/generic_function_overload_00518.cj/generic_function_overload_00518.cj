// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
record X<T>{}

trait TR{
    func test(a:This,b:Int16):Int64
    func test(a:This,b:Int32):Int64
}

append<T> X<T> with TR{
    func test(a:X<T>,b:Int32):Int64{1}
    func test(a:X<T>,b:Int16):Int64{2}
}


func main():Int64{
    var res1 = X<Int64>().test(1) // EXPECTED: regex ambiguous match for function call
    return 0
}