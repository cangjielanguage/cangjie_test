// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
    func b(x:Int64){0}
}


func main(): Int64 {
    var i = A.a
    i.b(1)
}
