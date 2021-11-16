// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Coo.a != 2 || Boo.a != 1){
        return 1
    }
    return 0
}

open class Boo {
    static prop var a : Int64 {
        get(){ return 1 }
        set(v) {}
    }
}

class Coo <: Boo {
    redef static prop var a : Int64 {
        get(){ return 2 }
        set(v) {}
    }
}