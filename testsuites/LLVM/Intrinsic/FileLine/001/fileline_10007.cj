// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10007.cj 7


var a = sourceFile()
var b = sourceLine()

func main(){
    print("${a} ${b}")
    return 0
}