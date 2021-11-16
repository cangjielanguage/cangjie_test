// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo():Unit{}

class A{
    ~init()
    {
        return foo()
    }
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}