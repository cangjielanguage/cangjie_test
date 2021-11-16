// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan finalizer: fileline_10027.cj 9
// ASSERT: scan success

class A{
    ~init(){
        var a = sourceFile()
        var b = sourceLine()
        print("finalizer: ${a} ${b}\n")
    }
}


func main(){
    let x = A()
    NativeGC()
    sleep(200*1000*1000)
    print("success")
    return 0
}