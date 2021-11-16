// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10002.cj 5

var a = print("${sourceFile()} ${sourceLine()}\n")

func main(){
    return 0
}