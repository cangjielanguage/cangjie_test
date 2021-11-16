// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = 1
func b(input:Int64){0}


func main(): Int64 {
    return a |> b
}
