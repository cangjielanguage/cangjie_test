// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: 1 2
func foo(){
    sourceFile();
    1
}

func bar(){
    sourceLine();
    2
}



func main(){
    let x = foo()
    let y = bar()
    print("main:${x} ${y}\n")
    return 0
}