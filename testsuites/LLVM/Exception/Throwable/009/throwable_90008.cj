// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-1: %run %run_opt %output %run_args


class B <: Throwable{}

class A <: Throwable{
    override func getMessage():String{ return "a"}
    override func toString():String{throw B(); return "b"}
}

func main(): Int64 {
    throw A()
    return 0
}
