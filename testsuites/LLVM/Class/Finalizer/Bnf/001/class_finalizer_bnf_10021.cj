// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan flag is 0.flag is 1.

var flag = 0

class A{
    var x : Int64 = 0
    ~init(){flag+=1}
}

func main(){
    var a = A()
    NativeGC()
    a.x
    print("flag is ${flag}.")
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.\n")
    return 0
}