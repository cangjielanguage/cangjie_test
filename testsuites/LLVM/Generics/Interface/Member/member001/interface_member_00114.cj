// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<I>{
    func t(a:I):I
}

class A <: I<Int32> {
    func t(a:Int32):Int32{a}
}

func main(){
A()
return 0
}