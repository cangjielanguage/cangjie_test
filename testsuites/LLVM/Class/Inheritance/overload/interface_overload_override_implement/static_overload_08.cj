// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Data{
    static func foo (a: Int64) : Int64{
        return 1
    }

    func fooo (a!: Int64) : Int64{
        return 1
    }
}


interface Data2{
    static func foo (a!: Int64) : Int64{
        return 2
    }
}


class Test <: Data & Data2{
    static func foo (a: Int64) : Int64{
        return a
    }
}

func main(): Int64 {
    var res1 : Int64 = Test().fooo(a: 2)
    var res2 : Int64 = Test.foo(2)
    if ( res1 != 1 || res2 != 2 ) {
        return 1
    }
    return 0
}