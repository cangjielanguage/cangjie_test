// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10021.cj 13

record A{
    A(var a !: String = sourceFile(),var b !: Int64 = sourceLine()){
    }

}


func main(){
    var i = A()
    let x = i.a
    let y = i.b
    print("main:${x} ${y}\n")
    return 0
}