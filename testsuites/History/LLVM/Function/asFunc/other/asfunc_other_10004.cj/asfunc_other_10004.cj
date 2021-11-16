// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait X{
    func asFunc(a:This,b:This,c:This):Bool
}

append Bool with X{
    func asFunc(a:Bool,b:Bool,c:Bool):Bool{a}
}

func main(): Int64 {
    true(true(true,true),true(true,true))
    return 0
}
