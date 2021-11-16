// ERRCHECK: %compiler %cmp_opt %f -o %output


var flag = 0


class A{
    ~init(){{x:Int64=>this}} // EXPECTED: regex 'this' cannot be used as an expression in the finalizer
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