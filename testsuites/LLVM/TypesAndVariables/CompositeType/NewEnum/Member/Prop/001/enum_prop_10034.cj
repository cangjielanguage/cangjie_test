// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    prop var b : A{
       get(){A()}
       set(v){}
    }
}

func main(): Int64 {
    var i = A()
    i.b.b.b.b.b.b
    return 0
}
