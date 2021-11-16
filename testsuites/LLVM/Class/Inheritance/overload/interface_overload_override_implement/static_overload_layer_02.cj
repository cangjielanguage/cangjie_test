// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Base3  {
    func foo (): Int64
}


interface Data <: Base3 {
    func foo () : Int64{
        return 1
    }

    func foo (a : Int64) :Int64 {
        return a
    }

}

class Test <:Data {
    
}

func main(): Int64 {
    var res1 : Int64 = Test().foo()
    var res2 : Int64 = Test().foo(2)
    if ( res1 != 1 || res2 != 2 ) {
        return 1
    }
    return 0
}