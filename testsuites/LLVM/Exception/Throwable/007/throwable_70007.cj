// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class B <: Throwable{}


func test(){
    try { } catch (a:A){}
    finally{
            return 10

            try{} finally {}

        }
    return 0
}


func main() {
    var res = test()
    print("success")
    return res - 10
}
