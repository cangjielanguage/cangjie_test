// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the return type with the overrride modifier
class A {
    open func f(){
        return 1
    }
}

class B <: A{
    override func f(){
        return 0
    }
}

func main(): Int64{
    let a = B()
    let c = a.f()
    return c
}
