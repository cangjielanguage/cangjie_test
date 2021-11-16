// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(){1}
}

var a = A()

func main(){
    func a(){2}
    return a() - 2
}