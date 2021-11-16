// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10011.cj 11

class A{
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
    let x = A().foo()
    let y = A().bar()
    print("${x} ${y}\n")
    return 0
}