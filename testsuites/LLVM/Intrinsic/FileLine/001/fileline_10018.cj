// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10018.cj 14

interface A{
prop let b : String {
    get(){
        var a = sourceFile()
        return a
    }
    }
prop let c : Int64 {
    get(){
        var a = sourceLine()
        return a
    }
    }
}

class B <: A{}

func main(){
    let x = B().b
    let y = B().c
    print("main:${x} ${y}\n")
    return 0
}