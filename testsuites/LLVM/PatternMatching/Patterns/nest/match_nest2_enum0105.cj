// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year(Int64)
}

var r1 = match (Year(1)) {
    case Year(b:Int64) => 0
    case _ => 1
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }

    return 0
}
