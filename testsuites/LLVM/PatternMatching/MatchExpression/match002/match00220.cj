// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum TimeUnit {
    Year(Int32)
}

func test(): Int64 {
    var res = match (TimeUnit.Year(2020)) {
        case _ => 0
    }
    return res
}

func main(): Int64 {
    return test()
}
