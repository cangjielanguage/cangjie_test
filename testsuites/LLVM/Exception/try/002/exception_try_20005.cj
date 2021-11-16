// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan the exception catch type must be class and extends from core.Throwable

class A <: Exception{}

func main(){
    try{throw A()}
    catch (a:Int64) {return 0}
    finally{}
    return 1
}