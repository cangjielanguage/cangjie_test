// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{}
class B <: A{}

func x(input:A):A {input}

func y(input:A):A {input}

func main(): Int64 {
    B() |> (x ~> y)
    return 0
}
