// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<Y>{
    func t(a:Int64):Int64{a}
}

class A <: I<Int32> {
}

func main(){
A()
return 0
}