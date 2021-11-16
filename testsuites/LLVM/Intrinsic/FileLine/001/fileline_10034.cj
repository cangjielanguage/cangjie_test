// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10034.cj

func foo(a!:String = sourceFile()){a}

func main(){
    let x = foo()
    print("main:${x}\n")
    return 0
}