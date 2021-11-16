// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent"
        case failScore =>
            let passNeed = 60 - failScore
            "failed with ${failScore}, and ${passNeed} need to pass"
    }
    if (result == "failed with 50, and 10 need to pass") {
        return 0
    }
    return 1
}

