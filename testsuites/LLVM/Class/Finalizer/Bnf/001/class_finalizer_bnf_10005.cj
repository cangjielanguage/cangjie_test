// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    func foo(){}
    ~init(){foo();flag+=1} // EXPECTED: regex 'foo' cannot be captured in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    print("flag is ${flag}.\n")
    return 0
}