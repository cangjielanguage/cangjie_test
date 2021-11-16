// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Bool):Int64}
append Bool with X{func asFunc(x:Bool,y:Bool):Int64{0}}


func main(): Int64 {
    return 1==1 |> 1!=1
}
