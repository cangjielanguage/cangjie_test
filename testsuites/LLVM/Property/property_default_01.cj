// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var b = Coo()
    if ( b.m != 1 ) {
        return 1
    }
    if ( b.n != 2 ) {
        return 1
    }
    return 0
}

interface Boo{
    prop var m: Int64 {
        get(){
             1 // retrun 1
        }
        set(input){
             () // return ()
        }
    }
    prop let n: Int32 {
        get(){
             return 2
        }
    }
}

class Coo <: Boo {
}
