// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func f(input:Int64):Int64 {0}

func main(): Int64 {
    return (return 0) |> f // EXPECTED: regex expression of Nothing type cannot appear here currently
}
