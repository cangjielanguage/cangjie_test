// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
class A<T>{
    init(a:T){print("A_first")}
    init(a:Int64){print("A_second")}
}

func test(a:A<Int64>){} // EXPECTED: regex-auto instantiation 'A<Int64>' causes ambiguous functions named 'init' in declaration 'A<Int64>'

func main():Int64{
    return 1
}