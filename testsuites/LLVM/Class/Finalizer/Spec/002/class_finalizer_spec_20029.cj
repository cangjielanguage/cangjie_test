// ERRCHECK: %compiler %cmp_opt %f -o %output


var flag = A()


func foo(a:A){}

class A{
    ~init(){flag = this} // EXPECTED: regex 'this' cannot be used as an expression in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}