// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

record C{
    public func test(x!:Bool=if(true){throw A();true}else{true}){}
}


func main() {
    try{
        C().test()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
