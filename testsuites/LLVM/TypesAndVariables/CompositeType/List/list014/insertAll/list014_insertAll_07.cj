// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan inconsistent element type for List literal
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(){
    var a:List<Int64> = []
    var b = a.insertAll(0,["1"])
    return 0
}