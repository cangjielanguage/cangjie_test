// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello finally

class A <: Exception{}

func main(){
    try {}
    catch (_) {print("hello catch\n")}
    finally{print("hello finally\n")}
    return 0
}