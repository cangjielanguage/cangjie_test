// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan beforeGCsuccess

from std import sync.*

class A<T>{
    ~init()
    {
        var m = Mutex()
        synchronized (m){}
    }
}

func test(){
    var a = A<Int64>()
}

func main(){
    test()
    print("beforeGC")
    NativeGC()
    print("success")
    return 0
}