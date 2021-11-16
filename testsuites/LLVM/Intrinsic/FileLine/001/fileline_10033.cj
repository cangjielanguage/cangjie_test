// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:8

func foo(a!:Int64 = sourceLine()){a}

func main(){
    let x = foo()
    print("main:${x}\n")
    return 0
}