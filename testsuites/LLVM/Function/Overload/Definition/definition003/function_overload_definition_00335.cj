// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface GrandFather{ func foo(a:Int8):Int64{return 1} }
interface Father <: GrandFather{
    func foo(a:Int8):Int64{return 1}
    
}

class Child <: Father{
    open func foo(a:Int16):Int64{return 2}
}

func main(){
    return 0
}
