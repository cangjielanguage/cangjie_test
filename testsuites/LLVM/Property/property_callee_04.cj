// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if(Boo.a != 2 ){
        return 1
    }
    if(Boo.b != 1 ){
        return 2
    }
    if(Boo.c != () ){
        return 3
    }
    return 0
}

record Boo{
    static prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    static prop let n:Int32 {
        get(){
             return a
        }
    }
    static var a:Int32 = 1 // a = 1
    static var b:Int32 = if(true){
        a
    }else {
        0
    }
    // a = 1,b = 1
    static var c:Unit = if(true){
         m = 1
     } // a = 2,c = ()
}

