// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    return 0
}

open class Boo{
    prop var a1:Int64 {
        get(){
            return 0
        }
        set(v) {}
    }
    prop let b1:Int64 {
        get(){
            return 0
        }
    }
}
class Coo <: Boo {
}

