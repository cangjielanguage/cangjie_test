// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var result = match (100) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case grade@ 90 | 100 => "${grade}, excellent!"
        case grade=> grade.toString()
    }
    if (result == "100, excellent!") {
        return 0
    }
    return 1
}

