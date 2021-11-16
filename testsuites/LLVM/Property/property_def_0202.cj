// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Doo()
    if ( a.m != 10 ) {
        return 1
    }
    if ( a.n != 20 ) {
        return 2
    }
    a.m = 1
    if ( a.m != 10 ) {
        return 3
    }
    if ( a.n != 20 ) {
        return 4
    }
    return 0
}

interface Boo{
    prop var m:Int32
    prop let n:Int32
}

interface Coo <: Boo  {
    prop var m:Int32 {
        get(){
             return 1
        }
        set(input){
            ()
        }
    }
    prop let n:Int32
}

class Doo <: Coo{
    prop var m:Int32 {
        get(){
             return ( 10 )
        }
        set(input){
             ()
        }
    }
    prop let n:Int32 {
        get(){
             return 20
        }
    }
}
