// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let score: Int64 = 90
    let PASS = 60
    let FULL = 100
    var scoreResult: String = match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case $PASS => "pass"
        case 70 | 80 => "good"
        case 90 | $FULL => "excellent" // matched
        case _ => "not a valid score" 
    }
    return 0
}

