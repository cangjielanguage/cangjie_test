// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_10015.cj 15

enum A{
a
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
    let x = a.b
    let y = a.c
    print("main:${x} ${y}\n")
    return 0
}