// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    let score: Int64 = 50
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case failScore => {
        let passNeeded = 60 - failScore
        "failed with ${failScore}, and needs ${passNeeded} more to pass"
        }() 
    }
    if ( scoreResult != "failed with 50, and needs 10 more to pass" ) {
        return 1
    }
    0
}
