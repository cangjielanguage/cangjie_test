// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10014.cj 12

enum A{
a
func foo(){
    var a = sourceFile()
    return a
}
func bar(){
    var a = sourceLine()
    return a
}
}


func main(){
    let x =a.foo()
    let y = a.bar()
    print("${x} ${y}\n")
    return 0
}