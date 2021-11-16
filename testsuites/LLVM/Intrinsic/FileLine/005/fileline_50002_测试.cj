// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50002_测试.cj

func main(){
    var a : String = sourceFile()
    print(a)
    return 0
}