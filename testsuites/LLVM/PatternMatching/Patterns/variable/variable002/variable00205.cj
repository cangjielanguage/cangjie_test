// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Good {
    var grade = ""
    init(x: Int32){
        if (x > 60) {
            grade = "good"
        } else {
            grade = "N/A"
        }
    }
}

func main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case 60 => "pass"
        case 100 => "Full"
        case good => Good(good).grade
    }
    if (result == "good") {
        return 0
    }
    return 1
}

