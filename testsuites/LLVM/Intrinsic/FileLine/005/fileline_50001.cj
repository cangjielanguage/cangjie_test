// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_50001.cj10

func main(){
    var a : ?String = None
    var b = a??sourceFile()
    print(b)
    var c : ?Int64 = None
    var d = c??sourceLine()
    print(d.toString())
    return 0
}