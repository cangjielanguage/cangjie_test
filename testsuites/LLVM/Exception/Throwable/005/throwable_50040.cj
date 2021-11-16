// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

record C{
    private func test(x!:Bool=if(true){throw A();true}else{true}){}
    func foo(){test()}
}


func main() {
    try{
        C().foo()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
