// ERRCHECK: %compiler %cmp_opt %f -o %output

record A<T>{}

func f<T>(input:A<T>):Int64 {0}

func test<T>(input:T):Int64 {
    return A<Int64>() |> f<T> // EXPECTED: regex type check of flow expression fails for operator |>

func main(): Int64 {
    return test<Int64>(1)
}
