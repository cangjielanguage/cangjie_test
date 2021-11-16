// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func x(input:Int64):Int64 {input}

func y(input:Int64):Int64 {input}

func main(): Int64 {
    (return 0) |> (x ~> y) // EXPECTED: regex type check of flow expression fails for operator |>
    return 0
}
