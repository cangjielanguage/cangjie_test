// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Bool):Bool}
append Bool with X{func asFunc(x:Bool,y:Bool):Bool{x}}


func main(): Int64 {
    true |> true
    return 0
}
