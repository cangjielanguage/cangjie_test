// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class B<T>{}

func test<T>(i:T){
    var a : B<?T> = B<?T>()
}

func main(): Int64 {
    test<Int64>(0)
    return 0
}
