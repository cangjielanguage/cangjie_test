// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i: Int32 = 91
    var result = match (i) {
        case 90 => "good"
        case good => good.toString()
        case _ => "excellent"

    }
    if (result == "91") {
        return 0
    }
    return 1
}


