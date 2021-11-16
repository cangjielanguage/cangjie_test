// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(input:Unit):Int64{0}
var a = 1

func main(): Int64 {
    return (a = 0) |> f
}
