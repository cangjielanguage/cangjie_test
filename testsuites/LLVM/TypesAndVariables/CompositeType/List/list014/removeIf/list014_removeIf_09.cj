// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot convert a character literal to type 'Int64'
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.removeIf({i=>i=='1'})
    return 0
}