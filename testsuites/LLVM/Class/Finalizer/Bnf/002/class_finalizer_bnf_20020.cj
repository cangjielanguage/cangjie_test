// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: scan A0

class A0{
    ~init()
    {
        print("A0\n")
        var a = A1()
        print("beforeFinalizerGC\n")
        NativeGC()
        print("afterFinalizerGC\n")
        //sleep(200*1000*1000)
    }
}

class A1{
    ~init()
    {
        print("A1")
    }
}


func test(){
    var a = A0()
}

func main(){
    test()
    print("beforeGC\n")
    NativeGC()
    sleep(200*1000*1000)
    print("success\n")
    return 0
}