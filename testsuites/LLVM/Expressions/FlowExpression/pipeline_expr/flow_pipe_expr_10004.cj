// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(input:Int64):Int64{0}

func main(): Int64 {
    return (if (true) {1} else {0}) |> (if (true) {f} else {f})
}
