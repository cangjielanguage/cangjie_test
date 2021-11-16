// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag : B = B()


open class B{
    func foo(){this}
    open func x(){1}
}

class A <: B{
    ~init(){flag = super.foo()} // EXPECTED: regex 'foo' cannot be captured in the finalizer
    override func x(){2}
}

func test(){
    var a = A()
}

func main(){
    print("${flag.x()}\n")
    test()
    NativeGC()
    print("${flag.x()}\n")
    return 0
}