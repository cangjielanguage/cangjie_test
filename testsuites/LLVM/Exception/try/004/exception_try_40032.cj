// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40032.cj:9)
class A <: Exception{}

func main(){
    var a : Array<Int64> = @{1}
    a[try{if (true){throw A()}else{1}}finally{}]
    return 0
}