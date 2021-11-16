// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a:Coo = Coo()
    var b:Int64 = a.b
    if ( b != 0 ) {
        return 1
    }
    return 0
}

open class Boo{
    public prop var a:Int64 {
        get(){
            return 0
        }
        set(v){}
    }
    prop let b:Int64 {
        get(){
            return 0
        }
    }

}
class Coo <: Boo {
}

