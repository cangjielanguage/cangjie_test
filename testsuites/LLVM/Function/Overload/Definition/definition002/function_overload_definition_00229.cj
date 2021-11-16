// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{
    open func foo(a:Int8):Int64{return 1}
    
}

class Child <: Father{
    public func foo(a:Int16):Int64{return 2}
}

func main(){
    var i = Child()
    if (i.foo(Int16(1)) != Int64(2)) {
        return 1
    }
    return 0
}
