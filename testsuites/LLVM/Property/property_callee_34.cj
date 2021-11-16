// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var x = Boo()
    if(x.a != 2 ){
        return 1
    }
    if(x.b != 1 ){
        return 2
    }
    if(x.c != () ){
        return 3
    }
    return 0
}

record Boo{
    var a:Int32 = 1 // a = 1
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    prop let n:Int32 {
        get(){
             return a
        }
    }
    var b:Int32 = if(true){
        a
    }else {
        0
    }
    var c:Unit = if(true){
         m = 1 // EXPECTED: regex 'm' is not allowed to be accessed before all member variables are initialized
    }
}

