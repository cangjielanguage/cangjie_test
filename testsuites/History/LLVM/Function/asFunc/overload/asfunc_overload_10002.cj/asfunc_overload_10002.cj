// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

trait X{
    func asFunc(input:This):Int64
    func asFunc(input:This,input_b:Int64):Int64
    func asFunc(input:This,input_b:Int32):Int64
}

append A with X{
    func asFunc(input:A){1}
    func asFunc(input:A,input_b:Int64){2}
    func asFunc(input:A,input_b:Int32){3}
}

func main(){
    var a : A = A()
    return a() + a(1) - 3
}