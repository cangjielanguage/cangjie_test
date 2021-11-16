// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan type check of flow expression fails for operator |>


class A <: Exception{}

func test(a:Int64):Int64{a}

func main(){
    (throw A()) |> test
    return 0
}