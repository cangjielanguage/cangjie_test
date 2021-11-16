// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Float64):Float64}
append Float64 with X{func asFunc(x:Float64,y:Float64):Float64{0.0}}


func main(): Int64 {
    0XFP-1 |> 0XFP-1
    return 0
}
