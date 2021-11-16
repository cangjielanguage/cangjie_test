// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    ~init()
    {
        func bar(a:Bool){a}
        var foo={a:Bool=>a}
    }
}

func test(){
    var a = A<Int64>()
}

func main(){
    test()
    NativeGC()
    return 0
}