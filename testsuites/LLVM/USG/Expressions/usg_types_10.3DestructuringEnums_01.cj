// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day
}

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}

func main() : Int64 {
    let a: Int32 = 1
    let b: Int64 = 2
    let time1 = TimeUnit1.Year(a)
    let time2 = TimeUnit2<Int64>.Month(b)

    let howManyHours1: Int32 = match(time1){
        case Year(x) => x * 365 * 24
        case Month(y) => 30 * 24
        case Day => 24
    }

    let howManyHours2: Int64 = match(time2){
        case Year(x) => 365 * 24
        case Month(y) => y * 30 * 24
        case Day => 24
    }

    print("One Year has ${howManyHours1} hours\n")
    print("Two Month has ${howManyHours2} hours\n")
    return 0
}
