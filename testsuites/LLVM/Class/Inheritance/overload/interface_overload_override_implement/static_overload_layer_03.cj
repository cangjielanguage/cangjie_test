// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Base3  {
     func foo (): Int64
}


interface Data  {
    func foo () : Int64{
        return 1
    }

    func foo (a: Int64) :Int64 {
        return a
    }

}

class Test <: Base3 & Data{
    
}

func main(): Int64 {
    return 0
}