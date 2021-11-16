// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception RuntimeException IndexOutOfBoundsException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
    var a:List<String> = ["1","2","3"]
    var b = a.remove(3)
    return 0
}