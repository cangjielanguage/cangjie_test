// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan missing '(' in try expression
func main(){
    try  catch finally
    return 0
}
