// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan main:fileline_10023.cj 10
var a : String = "1"
var b : Int64 = 1

class A{
    A(){
        a = sourceFile()
        b = sourceLine()
    }

}


func main(){
    A()
    let x = a
    let y = b
    print("main:${x} ${y}\n")
    return 0
}