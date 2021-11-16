// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{a}

func x(input:A):A {input}

func y(input:A):A {input}

func main(): Int64 {
    A.a |> (x ~> y)
    return 0
}
