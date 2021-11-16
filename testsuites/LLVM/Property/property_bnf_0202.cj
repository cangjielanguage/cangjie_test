// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    Coo.a1 = 1
    if ( Coo.a1 != 0 ){
        return 1
    }
    return 0
}

abstract class Boo{
    static prop var a1:Int64{
        get(){
            return 100
        }
        set(v){}
    }
}

class Coo <: Boo {
    redef static prop var a1:Int64 {
        get(){
            return 0
        }
        set(v){}
    }
}


