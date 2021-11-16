// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case other => other.toString()
    }
    if (result == "50") {
        return 0
    }
    return 1
}

