// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Int64):Int64}
append<T> T with X{func asFunc(x:T,y:Int64):Int64{0}}


func main(): Int64 {
    return 1 |> 1..10
}
