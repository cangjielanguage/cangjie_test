// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected ':' after catch pattern in catch expression

class A <: Exception{}

func main(){
    try{throw A()}
    catch (a) {return 0}
    finally{}
    return 1
}