// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10013.cj 11

interface A{
func foo(){
    var a = sourceFile()
    return a
}
func bar(){
    var a = sourceLine()
    return a
}
}

class B <: A{}

func main(){
    let x = B().foo()
    let y = B().bar()
    print("${x} ${y}\n")
    return 0
}