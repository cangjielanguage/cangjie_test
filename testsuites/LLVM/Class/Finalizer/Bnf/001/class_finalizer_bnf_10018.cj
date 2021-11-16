// ERRCHECK: %compiler %cmp_opt %f -o %output


var x = A()

open class A {
}

class B <: A{
    ~init(){x = foo()} // EXPECTED: regex 'foo' cannot be captured in the finalizer
}

extend A{
    func foo(){this}
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}