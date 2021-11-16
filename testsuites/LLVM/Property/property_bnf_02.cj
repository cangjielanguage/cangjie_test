// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo()
    var b = Boo()
    a.a1 = 1
    if ( a.a1 != 2 ){
        return 1
    }
    if ( a.goo() != 0 ){
        return 2
    }
    if ( b.foo() != 0 ){
        return 3
    }
    Boo.a4 = 4
    if ( Boo.a4 != 5 ){
        return 4
    }
    Coo.a4 = 4
    if ( Coo.a4 != 5 ){
        return 4
    }
    a.a5 = 5
    if ( a.a5 != 6 ){
        return 5
    }
    a.a6 = 6
    if ( a.a6 != 7 ){
        return 6
    }
    a.a7 = 7
    if ( a.a7 != 8 ){
        return 7
    }
    return 0
}

open class Boo{
    var a: Int64 = 1
    static var b: Int64 = 1
    public prop var a1:Int64 {
        get(){
            return ( a + 1 )
        }
        set(v){ a = v}
    }

    private prop var a2:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    protected prop var a3:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    static prop var a4:Int64 {
        get(){
             return ( b + 1 )
        }
        set(v){ b = v}
    }


    open prop var a5:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    prop var a6:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    prop var a7:Int64 {
        get(){
             return ( b + 1 )
        }
        set(v){ b = v}
    }

    func foo(){
        var a = Boo()
        a.a2 = 1
        if ( a.a2 != 2 ){
            return 1
        } else {
            return 0
        }
    }
}

class Coo <: Boo {
    func goo(){
        var a = Boo()
        a.a3 = 1
        if ( a.a3 != 2 ){
            return 1
        } else {
            return 0
        }

    }
}

