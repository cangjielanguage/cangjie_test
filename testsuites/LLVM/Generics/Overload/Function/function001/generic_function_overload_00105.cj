// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
class A<T>{
    func test(a:T){print("A_first")}
    func test(a:Int64){print("A_second")}
}

func test(a:A<Int64>){} // EXPECTED: regex instantiation 'A<Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64>'

func main():Int64{
    return 1
}