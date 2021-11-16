// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Int64

func f(input:mytype):Int64 {0}

func main(): Int64 {
    return 1 |> f
}
