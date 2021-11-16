// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(){1}
    operator func ()(input:Int64){2}
    operator func ()(input:Int32){2}
}

func main(){
    var a : A = A()
    return a() + a(1) - 3
}