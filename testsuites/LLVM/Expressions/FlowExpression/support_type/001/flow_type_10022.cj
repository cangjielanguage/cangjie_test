// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{a}

func f(input:A):Int64 {0}

func main(): Int64 {
    return A.a |> f
}
