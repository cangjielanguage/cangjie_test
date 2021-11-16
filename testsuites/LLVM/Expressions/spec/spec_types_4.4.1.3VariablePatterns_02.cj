// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let score: Int64 = 50
    var scoreResult: String = match (score) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"  // matched
        case failScore =>  // variable pattern
             let passNeed = 60 - failScore
             "failed with ${failScore}, and ${passNeed} need to pass"
    }
    return 0
}

