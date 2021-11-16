// ERRCHECK: %compiler %cmp_opt %f -o %output


var flag = 0


func foo(a:A){}

class A{
    ~init(){return this} // EXPECTED: regex type of return expression is incompatible with return type
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