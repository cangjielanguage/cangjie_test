// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10025.cj 11


record A{
    var a : String = "1"
    var b : Int64 = 1
    A(){
        a = sourceFile()
        b = sourceLine()
    }

}


func main(){
    var i = A()
    let x = i.a
    let y = i.b
    print("main:${x} ${y}\n")
    return 0
}