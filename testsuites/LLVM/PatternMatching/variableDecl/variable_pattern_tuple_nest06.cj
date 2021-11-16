// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var (a,Day(b)) = (1,TimeUnit.Day(1))
    if ( a != 1 ) {
        return 1
    }
    var c = match (b) {
        case 1 => 1
        case _ => 2
    }
    if ( c != 1 ) {
        return 2
    }
    return 0
}

enum TimeUnit{
    Day(Int32)
}