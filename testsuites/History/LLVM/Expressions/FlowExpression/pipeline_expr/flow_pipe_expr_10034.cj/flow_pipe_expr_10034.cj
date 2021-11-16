// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:String):Int64}
append String with X{func asFunc(x:String,y:String):Int64{0}}


func main(): Int64 {
    return "a" |> "a"
}
