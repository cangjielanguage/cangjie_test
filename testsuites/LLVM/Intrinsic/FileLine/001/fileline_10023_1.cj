// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10023_1.cj 12

var a : String = "1"
var b : Int64 = 1



func main(){
    a = sourceFile()
    b = sourceLine()
    let x = a
    let y = b
    print("main:${x} ${y}\n")
    return 0
}