// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Option<Int64>):Option<Int64>}
append Option<Int64> with X{func asFunc(x:Option<Int64>,y:Option<Int64>):Option<Int64>{x}}


func main(): Int64 {
    Some<Int64>(1) |> Some<Int64>(1)
    return 0
}
