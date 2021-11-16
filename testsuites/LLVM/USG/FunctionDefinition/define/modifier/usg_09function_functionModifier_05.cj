// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the extend class
open class A{
    protected func a(){
        return 0
    }
}

class A2 <: A{
    public func a2(){
        a()
    }
}

func main(): Int64{
    let a = A2().a2
    let c = a()
    return c
}