// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo()
    var b = Boo()
    a.a1 = 1
    if ( a.a1 != 3 ){
        return 1
    }
    b.a1 = 1
    if ( b.a1 != 2 ){
        return 1
    }
    return 0
}

open class Boo{
    var a: Int64 = 1
    static var b: Int64 = 1
    open prop var a1:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }
}

class Coo <: Boo {
    override prop var a1:Int64 {
        get(){
             return ( a + 2 )
        }
        set(v){ a = v}
    }

}

