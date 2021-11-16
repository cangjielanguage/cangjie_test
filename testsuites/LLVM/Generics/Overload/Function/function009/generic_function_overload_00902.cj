// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped

class A<T>{
    static func test(a:T){return 1}
    static func test(a:T,b:Int64=1){return 2}
}

func main():Int64{
    var I = A<Int64>.test(1) // EXPECTED: regex ambiguous match for function call
    return 0
}