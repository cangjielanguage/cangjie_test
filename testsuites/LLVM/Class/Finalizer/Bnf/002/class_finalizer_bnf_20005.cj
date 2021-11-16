// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    ~init() // EXPECTED: regex class's constructor or finalizer should have function body
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}