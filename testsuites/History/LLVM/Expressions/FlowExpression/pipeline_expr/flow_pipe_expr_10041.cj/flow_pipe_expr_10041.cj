// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{a}
trait X{func asFunc(x:This,y:A):Int64}
append A with X{func asFunc(x:A,y:A):Int64{0}}

func main(): Int64 {
    return A.a |> A.a
}
