// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main:fileline_10031.cj 14


class A{}

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
    var i = A()
    let x = i.foo()
    let y = i.bar()
    print("main:${x} ${y}\n")
    return 0
}