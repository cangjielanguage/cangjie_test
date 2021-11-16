// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10017.cj 14

class A{
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


func main(){
    let x = A().b
    let y = A().c
    print("main:${x} ${y}\n")
    return 0
}