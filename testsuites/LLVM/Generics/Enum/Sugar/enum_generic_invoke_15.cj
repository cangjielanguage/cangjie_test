// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T)
}

enum Date { Data(Int32) }


func run(): Int64 {
    let date = Date.Data(3)
    var data = match (date) {
        case Data(x) => TimeUnit.Year(x+1)
    }
    var res = match (data) {
        case Year(x) => x+2020
    }

    if (res == 2024) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
