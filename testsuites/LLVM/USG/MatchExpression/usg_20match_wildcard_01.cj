// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    let score: Int64 = 50
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case _ => "fail" // wildcard pattern: used for default case 
    }
    if ( scoreResult != "fail" ) {
        return 1
    }
    0
}

