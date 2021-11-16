// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Option<Int64>):Int64}
append Option<Int64> with X{func asFunc(x:Option<Int64>,y:Option<Int64>):Int64{0}}


func main(): Int64 {
    return Some<Int64>(1) |> Some<Int64>(1)
}
