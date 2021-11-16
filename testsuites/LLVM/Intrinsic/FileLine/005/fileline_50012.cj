// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 8

func main(){
    var a =  0
    +
    sourceLine()
    print("${a}")
    return 0
}