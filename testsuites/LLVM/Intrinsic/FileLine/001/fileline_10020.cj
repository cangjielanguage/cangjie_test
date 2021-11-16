// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10020.cj 12

record A{
var a : String = sourceFile()
var b : Int64 = sourceLine()
}


func main(){
    let i = A()
    let x = (i.a,i.b)
    print("main:${x[0]} ${x[1]}\n")
    return 0
}