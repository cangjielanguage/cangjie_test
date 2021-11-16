// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Unit):Int64}
append Unit with X{func asFunc(x:Unit,y:Unit):Int64{0}}


func main(): Int64 {
    return spawn \{} |> spawn \{}
}
