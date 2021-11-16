// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan beforeGCsuccess

from std import sync.*

var x = AtomicInt64(0)

class A<T>{
    ~init()
    {
        x.store(1)
    }
}

func test(){
    var a = A<Int64>()
}

func main(){
    test()
    print("beforeGC")
    NativeGC()
    sleep(200*1000*1000)
    if (x.load() == 1){
        print("success")
    }
    return 0
}