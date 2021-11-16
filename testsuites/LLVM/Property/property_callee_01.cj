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
    if(Boo.d != 2 ){
        return 4
    }
    if(Boo.e != 2 ){
        return 5
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
    static var b:Int32 = n // a = 1,b = 1
    static var c:Unit = ( m = 1) // a = 2,c = ()
    static var d:Int32 = n // a =2 ,d = 2
    static var e:Int32 = m // a = 2,e = 2
}

