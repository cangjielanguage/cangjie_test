// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func foo(){
    return sourceFile()
}

func bar(){
    return sourceLine()
}

func main(){
    let x = foo()
    let y = bar()
    //print("${x} ${y}\n")
    return 0
}