// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test() : Int64 {
    return throw Exception()
}

func main(): Int64 {
    try {
        test()
    } catch (_){
        return 0
    }
    return 1
}
