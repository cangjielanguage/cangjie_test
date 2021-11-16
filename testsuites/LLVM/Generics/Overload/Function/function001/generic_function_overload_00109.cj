// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped

open class A<X,Y>{
    func test(a:X,b:Y){}
    func test(a:Y,b:X){}
}

func test(a:A<Int32,Int32>){} // EXPECTED: regex instantiation 'A<Int32,Int32>' causes ambiguous functions named 'test' in declaration 'A<Int32,Int32>'

func main():Int64{
    return 0
}