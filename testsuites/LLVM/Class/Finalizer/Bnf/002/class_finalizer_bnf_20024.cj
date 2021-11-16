// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan beforeGC!A!afterGC!B!success!

class A{
    ~init()
    {
        print("A!")
        NativeGC()
        print("afterGC!")
    }
}

class B{
    ~init()
    {
        print("B!")
    }
}


func test(){
    var a = A()
    var b = B()
    return b
}

func main(){
    test()
    print("beforeGC!")
    NativeGC()
    sleep(200*1000*1000)
    print("success!")
    return 0
}