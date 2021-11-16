// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10020_2.cj 7

record A{
var a : String = {var x = sourceFile();return x}()
var b : Int64 = {var x = sourceLine();return x}()
}


func main(){
    let i = A()
    let x = (i.a,i.b)
    print("main:${x[0]} ${x[1]}\n")
    return 0
}