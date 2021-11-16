// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64)
    func b(x:Bool,y:Bool){1}
    func b(x!:Int64=0){x}
}

func main(): Int64 {
    return A.a(1).b()
}