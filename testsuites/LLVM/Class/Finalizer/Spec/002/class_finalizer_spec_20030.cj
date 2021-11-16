// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

func foo(a:A){}

class A{
    func test(){flag += 1;this}
    ~init(){foo(this.test())} // EXPECTED: regex 'test' cannot be captured in the finalizer
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