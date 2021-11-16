// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case 60 => "pass"
        case 100 => "Full"
        case good => match (good) {case good=>[good,good+1][0].toString()}
    }
    if (result == "90") {
        return 0
    }
    return 1
}

