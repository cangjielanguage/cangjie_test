// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Int64*Int64):Int64*Int64}
append Int64*Int64 with X{func asFunc(x:Int64*Int64,y:Int64*Int64):Int64*Int64{x}}


func main(): Int64 {
    (1,1) |> (1,1)
    return 0
}
