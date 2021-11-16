// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Father{
    func foo(a:Int8):Int64
    func foo(a:Int16):Int64{return 1}
}

interface Child <: Father{
    func foo(a:Int16):Int64{return 1}
}

func main(){
    return 0
}
