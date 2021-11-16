// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10010.cj 11

record A{
static func foo(){
    var a = sourceFile()
    return a
}
static func bar(){
    var a = sourceLine()
    return a
}
}

func main(){
    let x = A.foo()
    let y = A.bar()
    print("${x} ${y}\n")
    return 0
}