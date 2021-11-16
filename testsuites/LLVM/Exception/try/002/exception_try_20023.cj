// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan hello finally
// ASSERT: regex init

open class A <: Exception{}
class B <: A{}

func main(){
    try {throw A()}
    catch (_:B) {print("hello catch\n")}
    finally{print("hello finally\n")}
    return 0
}