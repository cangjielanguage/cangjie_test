// ERRCHECK: %compiler %cmp_opt %f -o %output

func f(input:Int64):Int64 {0}

func main(): Int64 {
    Bool |> f // EXPECTED: regex type check of flow expression fails for operator |>
    return 1
}
