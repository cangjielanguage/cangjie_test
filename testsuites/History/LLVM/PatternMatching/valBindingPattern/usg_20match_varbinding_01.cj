// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    let score: Int64 = 100
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case excellentScore@90 | 100 => "excellent! score = ${excellentScore}"
        case _ => "invalid score"
    }
    if ( scoreResult != "excellent! score = 100" ) {
        return 1
    }
    0
}