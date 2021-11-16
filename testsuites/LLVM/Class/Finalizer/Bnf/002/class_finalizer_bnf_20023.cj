// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: scan A!

class A{
    ~init()
    {
        print("A!")
    }
}

func test(){
    var a = A()
}

func main(){
    test()

    print("beforeGC\n")
    var f = spawn {
        NativeGC()
    }
    f.getResult()
    sleep(200*1000*1000)
    print("success\n")
    return 0
}