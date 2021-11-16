// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    return match ([1,2,3].get(2)) {
        case Some(v) => v
        case $None => -1
    }
}

func main(): Int64 {
    test() - 3
}
