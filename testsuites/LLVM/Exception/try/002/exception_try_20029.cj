// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The type of this catch block is 'Bool', which mismatches the smallest common supertype 'Int64' of previous branches.

func main(){
    try {Int64(1)}
    catch (_) {true}
    finally{}
    return 0
}