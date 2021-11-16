// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X<T>{func asFunc(x:This,y:T):Int64}
append<T> T with X<T>{func asFunc(x:T,y:T):Int64{0}}


func main(): Int64 {
    return 1..10 |> 1..10
}
