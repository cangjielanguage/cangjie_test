// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan undeclared identifier 'get'
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
        var a:List<Int64> = [1,2,3]
        get(a)
        return 0
}