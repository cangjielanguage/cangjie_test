// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10028.cj 9

func main(){
    let x = sourceFile
    let y = sourceLine
    let x_ = x()
    let y_ = y()
    print("${x_} ${y_}\n")
    return 0
}