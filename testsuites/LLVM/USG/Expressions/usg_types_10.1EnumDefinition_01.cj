// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day
}

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}

func main(){

    return 0
}

