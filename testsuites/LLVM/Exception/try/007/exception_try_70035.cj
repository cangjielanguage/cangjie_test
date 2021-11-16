// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan type check of flow expression fails for operator |>

class A <: Exception{}

func test(a:Int64){}

func main(){
    throw A() |> test
    return 0
}