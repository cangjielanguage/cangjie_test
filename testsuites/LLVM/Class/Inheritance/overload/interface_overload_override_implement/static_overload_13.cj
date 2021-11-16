// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface Data2{
    func foo (a: Int64) : Int64{
        return 2
    }
}

interface Data3 <: Data2{
    
}

open class Test1 <: Data2{
    private func foo () : Int64{
        return 3
    }
}

class Test <: Test1 & Data2 & Data3{
    
}

func main(): Int64 {
    var res2 : Int64 = Test().foo(2)
    if ( res2 != 2 ) {
        return 1
    }
    return 0
}
