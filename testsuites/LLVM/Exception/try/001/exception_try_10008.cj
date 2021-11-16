// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected block begin with '{'
func main(){
    try {} catch (_) {} finally
    return 0
}