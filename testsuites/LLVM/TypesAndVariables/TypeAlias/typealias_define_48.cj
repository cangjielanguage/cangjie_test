// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T>{ Year(T) | Month  }

type Time<T> = TimeUnit<T>

func main(): Int64 {
    var time: Time<Int32> = TimeUnit<Int32>.Year(2020)
    var res: Int32 = match (time) {
        case Year(x) => x
        case $Month => 11
    }
    if (res == 2020) {
        return 0
    }
    return 1
}