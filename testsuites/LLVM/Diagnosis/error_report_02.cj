// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64{
    var score: Int64 = 90
    var result: String  =  match score {    // EXPECTED: regex missing '\(' in match expression
        case 0 => "fail"
        case 60 => "pass"
        case 80 => "good"
        case 90 => "excellent"
        case _ => ""
    }

    if (result == "excellent") {
        return 0
    }
    return 1

}

