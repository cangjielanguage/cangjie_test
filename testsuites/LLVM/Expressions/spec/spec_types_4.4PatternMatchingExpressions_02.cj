// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let score = 80
    var result: String = match {
        case score < 60 => "fail"
        case score < 70 => "pass"
        case score < 90 => "good" // matched
        case _ => "excellent"
    }
    return 0
}

