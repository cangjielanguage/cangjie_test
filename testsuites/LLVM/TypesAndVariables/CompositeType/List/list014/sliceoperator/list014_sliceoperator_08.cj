// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
    var a = [1,2,3,4]
    var b = a[0:1]
    return 0
}
