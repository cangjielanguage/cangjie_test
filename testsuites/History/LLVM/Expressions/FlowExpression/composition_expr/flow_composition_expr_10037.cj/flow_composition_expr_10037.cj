// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{a}
trait X{func asFunc(x:This,y:A):A}
append A with X{func asFunc(x:A,y:A):A{x}}


func main(): Int64 {
    A.a |> A.a
    return 0
}
