// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    ~init()
    {
        return ()
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