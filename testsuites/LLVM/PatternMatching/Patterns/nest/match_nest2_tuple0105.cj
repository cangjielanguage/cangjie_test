// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var r1 = match (((),())) {
    case (b:Int64,a:Int64) => 2
    case (b:Unit,a:Unit) => 0
    case _ => 1
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
