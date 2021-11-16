// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X<T>{func asFunc(x:This,y:T):T}
append<T> T with X<T>{func asFunc(x:T,y:T):T{x}}


func main(): Int64 {
    1..10 |> 1..10
    return 0
}
