// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input: T): Int64{
    var a : List<T> = [input]
    var res = match (a) {
        case _ : List<T> => 0
        case _ => 1
    }
    return res
}

func main(): Int64 {
    return test<Int64>(1)
}
