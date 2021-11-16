// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = A()


interface B{
    func foo(){this}
}

class A <: B{
    ~init(){foo()} // EXPECTED: regex 'foo' cannot be captured in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}