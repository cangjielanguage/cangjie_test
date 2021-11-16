// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan set:fileline_10036.cj
// ASSERT:scan set:29
// ASSERT:scan main:fileline_10036.cj 25



record A{}

extend A{
    mut prop var a : String{
    get(){
        var a = sourceFile()
        return a
    }
    set(x){
        var a = sourceFile()
        print("set:${a}\n")
    }
    }

    mut prop var b : Int64{
    get(){
        var a = sourceLine()
        return a
    }
    set(x){
        var a = sourceLine()
        print("set:${a}\n")
    }
    }
}




func main(){
    var i = A()
    let x = A().a
    let y = A().b
    i.a = "1"
    i.b = 1
    print("main:${x} ${y}\n")
    return 0
}