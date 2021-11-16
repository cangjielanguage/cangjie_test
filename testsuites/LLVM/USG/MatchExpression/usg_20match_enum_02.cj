// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    | Year(Int32)
    | Month(Int32, Int32)
    | Day(Int32, Int32, Int32)
    | Hour(Int32, Int32, Int32, Int32)
}

func main() : Int64 {
    let x = TimeUnit.Hour(2021, 1, 1, 1)
    let dateString = match (x) {
        case Year(y) => "${y}/0/0"
        case Month(y, m) => "${y}/${m}/0"
        case Day(y, m, d) | Hour(y, m, d, _) => "${y}/${m}/${d}"
    }
    if ( dateString != "2021/1/1" ) {
        return 1
    }
    0
}
