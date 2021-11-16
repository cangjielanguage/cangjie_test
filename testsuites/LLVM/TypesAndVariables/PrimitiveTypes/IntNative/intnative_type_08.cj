// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : IntNative {
    let score: IntNative = 100
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case excellentScore => "excellent! score = ${excellentScore}"
        case _ => "invalid score"
    }
    if ( scoreResult != "excellent! score = 100" ) {
        return 1
    }
    0
}