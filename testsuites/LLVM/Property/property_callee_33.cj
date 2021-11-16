// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x = Boo()
    if(x.a != 1 ){
        return 1
    }
    if(x.b != 1 ){
        return 2
    }
    if(x.c != () ){
        return 3
    }
    if(x.d != 2 ){
        return 4
    }
    if(x.e != 2 ){
        return 5
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
    prop let b:Int32{
        get(){
             return a
        }
    }// a = 1,b = 1
    prop let c:Unit {
        get(){
             m = 1
        }
     } // a = 2,c = ()
    prop let d:Int32 {
        get(){
             return n
        }
     } // a =2 ,d = 2
    prop let e:Int32 {
        get(){
             return m
        }
    } // a = 2,e = 2
}

