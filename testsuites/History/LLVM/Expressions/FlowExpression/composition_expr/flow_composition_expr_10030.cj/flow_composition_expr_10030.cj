// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:String):String}
append String with X{func asFunc(x:String,y:String):String{x}}


func main(): Int64 {
    "a" |> "a"
    return 0
}
