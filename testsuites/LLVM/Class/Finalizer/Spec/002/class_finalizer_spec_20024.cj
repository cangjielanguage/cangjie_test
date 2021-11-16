// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var flag = 0

class A{
    ~init(){throw Exception()}
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}