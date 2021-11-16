// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan flag is 1.

var flag = 0

class A{
    static func x(){1}
    ~init(){flag+=x()}
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.\n")
    return 0
}