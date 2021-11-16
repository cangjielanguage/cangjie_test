// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Data{
    static func foo (a: Int64) : Int64
}

interface Data2{
    static func foo (a: Bool) : Int64
}

interface Data3{
    static func foo () : Int64{
        return 1
    }
}

class Test <: Data & Data2 &Data3{
    static func foo (a: Int64) : Int64{
        return a
    }

    static func foo (a: Bool) : Int64{
        if(a) {return 1}
        return 0
    }
    
}

func main(): Int64 {
    var res1 : Int64 = Test.foo(2)
    var res2 : Int64 = Test.foo(true)
    if ( res1 != 2 || res2 != 1 ) {
        return 1
    }
    return 0
}