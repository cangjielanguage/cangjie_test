// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}

func main() : IntNative {
    let b: IntNative = 2
    let time2 = TimeUnit2<IntNative>.Month(b)
    let howManyHours2: IntNative = match(time2){
        case Year(x) => 1 * 1
        case Month(y) => y * 30 * 24
        case Day => 24
    }
    return 0
}