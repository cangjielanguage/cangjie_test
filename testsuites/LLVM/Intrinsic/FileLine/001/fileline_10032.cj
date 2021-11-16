// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10032.cj 14


enum A{a}

extend A{
    func foo(){
        var a = sourceFile();
        return a
    }
    func bar(){
        var b = sourceLine();
        return b
    }
}


func main(){
    let x = a.foo()
    let y = a.bar()
    print("main:${x} ${y}\n")
    return 0
}