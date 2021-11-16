// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan catch!success

class A <: Throwable{}
class B <: Throwable{}


func test(){
    var i = 0
    while (i!=10){
        i++
        try {
            throw A()
        } catch (a:A){
            print("catch!")
            throw B()
        }  finally{
            try{
                break
            } finally {
                continue
            }
        }
    }
    return i
}


func main() {
    var res = test()
    print("success")
    return res - 10
}
