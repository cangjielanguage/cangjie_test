// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception RuntimeException IndexOutOfBoundsException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(){
    var a:List<Int64> = []
    var b = a.insertAll(1,[1])
    return 0
}