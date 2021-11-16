// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Array<Int64>):Int64}
append Array<Int64> with X{func asFunc(x:Array<Int64>,y:Array<Int64>):Int64{0}}


func main(): Int64 {
    return Array<Int64>(1,1) |> Array<Int64>(1,1)
}
