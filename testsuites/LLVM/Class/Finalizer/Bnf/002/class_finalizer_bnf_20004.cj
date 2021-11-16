// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    ~init{} // EXPECTED: regex expected function parameters after function name
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}