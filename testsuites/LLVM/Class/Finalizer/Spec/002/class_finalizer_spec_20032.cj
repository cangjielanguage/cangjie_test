// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

func foo(a:A){}

class A{
   operator func +(x:Int64){}
    ~init(){foo(this+1)} // EXPECTED: regex 'this' cannot be used as an expression in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.")
    return 0
}