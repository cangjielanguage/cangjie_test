// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(i:T,j:T){
    var a : Result<T> = Ok(i)
    match (a) {
        case Ok(v) => v
        case Err(_) => j
    }
}

func main(): Int64 {
    test<Int64>(0,1)
}
