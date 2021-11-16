// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var r1  = match ((TimeUnit.Year(1.0),Month(1.0,2.0))) {
    case (Month(b,c),Year(a))  => 1
    case (Year(y),Month(b,c)) => y-1.0+c-b-1.0
    case _ => 1
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
    }

func main() : Int64 {
    if ( r1 != 0.0 ) {
        return 1
    }

    return 0
}