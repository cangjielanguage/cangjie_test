// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected catch pattern after 'catch'
func main(){
    try{} catch {}
    return 0
}