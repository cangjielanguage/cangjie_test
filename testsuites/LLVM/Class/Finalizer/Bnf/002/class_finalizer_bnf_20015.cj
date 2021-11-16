// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    ~init()
    {
        let a = 1
        func bar(){a}
        var foo={a}
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