// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return 0
}

class B<T> where T<:Int32 {
    func foo(x:Int32){return 1}
    func foo(x:T){return 2}
}
