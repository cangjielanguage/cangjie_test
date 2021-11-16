// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(a:Int64):Int64{a}
}

func main(): Int64 {
    return 0 |> (A()~>A())
}