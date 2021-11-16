// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    init(a:?Int64){}
}

func main(){
    A(1)
    return 0
}