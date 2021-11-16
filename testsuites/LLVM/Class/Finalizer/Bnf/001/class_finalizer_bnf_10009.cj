// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    func x(){1}
    ~init(){var y = x} // EXPECTED: regex 'x' cannot be captured in the finalizer
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