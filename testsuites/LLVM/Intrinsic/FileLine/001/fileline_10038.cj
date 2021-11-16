// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10038.cj 7


var a = {var x = sourceFile();return x}
var b = {var y = sourceLine();return y}

func main(){
    let x = a()
    let y = b()
    print("main:${x} ${y}\n")
    return 0
}