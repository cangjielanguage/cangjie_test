// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50007.cj,8


func main(){
    var a : ?String = sourceFile()
    var b : ?Int64 = sourceLine()
    print("${a??""},${b??1}")
    return 0
}