// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan catch!success

class A <: Throwable{}
class B <: Throwable{}


func test(){

    while (true){
        try {
            throw A()
        } catch (a:A){
            print("catch!")
            throw B()
        }  finally{
            break
        }
    }
    return 10
}


func main() {
    var res = test()
    print("success")
    return res - 10
}
