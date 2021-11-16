// ERRCHECK: %compiler %cmp_opt %f -o %output


var flag = 0


func foo(a:A){}

class A{
    ~init(){foo(this)} // EXPECTED: regex 'this' cannot be used as an expression in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    print("flag is ${flag}")
    return 0
}