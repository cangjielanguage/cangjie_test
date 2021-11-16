// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan missing '(' in catch expression
func main(){
    try {} catch
    return 0
}
