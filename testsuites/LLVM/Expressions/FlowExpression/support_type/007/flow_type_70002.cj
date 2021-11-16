// ERRCHECK: %compiler %cmp_opt %f -o %output

func f(a:Int64, b:Int64):Int64 {0}

func main(): Int64 {
    1 |> f // EXPECTED: regex-auto type check of flow expression fails for operator |>
    return 1
}
