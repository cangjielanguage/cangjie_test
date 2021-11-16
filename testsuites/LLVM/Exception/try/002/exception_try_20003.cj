// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected catch pattern after 'catch'

class A <: Exception{}

func main(){
    try{throw A()}
    catch (Int64) {return 0}
    finally{}
    return 1
}