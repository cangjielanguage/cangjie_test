// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(){1}
}

func a(){2}

func main(){
    var a = A()
    return a() - 1
}