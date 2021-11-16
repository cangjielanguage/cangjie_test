// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{}

record R{
    var a: A<R> 
}

func main(): Int64{
    var a = A<R>()
    var b = R(a:a)
    return 0
}