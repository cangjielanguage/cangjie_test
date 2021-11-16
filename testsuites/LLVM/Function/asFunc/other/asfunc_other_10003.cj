// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    operator func ()(a:Int64,b:Int64,c:Int64){}
}

func main(): Int64 {
    A()(1,1,1)
    return 0
}
