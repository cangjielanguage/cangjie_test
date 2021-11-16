// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Int64

func x(input:mytype):mytype {input}

func y(input:mytype):mytype {input}

func main(): Int64 {
    1 |> (x ~> y)
    return 0
}
