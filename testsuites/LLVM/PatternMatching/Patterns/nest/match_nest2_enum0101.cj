// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year(Float32)
    | Month(Float32*Float32)
}

var r1 = match (Month((1.0,2.0))) {
    case Month((b,c))=> c-b-1.0
    case _ => 1
}

func main() : Int64 {
    if (r1 != 0.0) {
        return 1
    }
    return 0
}
