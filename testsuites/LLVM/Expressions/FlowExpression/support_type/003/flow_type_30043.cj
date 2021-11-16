// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return (return 0) |> f // EXPECTED: regex expression of Nothing type cannot appear here currently
}

func main(): Int64 {
    return test<Int64>(1)
}
