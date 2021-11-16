// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot convert a character literal to type 'Int64'
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
    var a:List<List<Int64>> = [[1,2,3],[4,5]]
    a[0].appendAll(['6','6'])
    return 0
}