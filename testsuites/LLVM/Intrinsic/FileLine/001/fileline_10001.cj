// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10001.cj 6

func main(){
    print("${sourceFile()} ${sourceLine()}\n")
    return 0
}