// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan flag is 1.

var flag = 0

class A<T>{
    var x : T
    init(u:T){x = u}
    ~init(){var a : T = x;flag+=1}
}

func test(){
    var a = A<Unit>(())
}

func main(){
    test()
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.\n")
    return 0
}