// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot convert an integer literal to type 'Interface-Collection<Int64>'
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.appendAll(6)
    return 0
}