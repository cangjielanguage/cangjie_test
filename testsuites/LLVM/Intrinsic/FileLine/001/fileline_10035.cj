// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan set:fileline_10035.cj
// ASSERT:scan set:29
// ASSERT:scan main:fileline_10035.cj 25



class A{}

extend A{
    prop var a : String{
    get(){
        var a = sourceFile()
        return a
    }
    set(x){
        var a = sourceFile()
        print("set:${a}\n")
    }
    }

    prop var b : Int64{
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
    let x = A().a
    let y = A().b
    A().a = "1"
    A().b = 1
    print("main:${x} ${y}\n")
    return 0
}