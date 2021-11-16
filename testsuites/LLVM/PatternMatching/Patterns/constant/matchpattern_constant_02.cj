// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a : Float64 = 1.0
    var result: Int64 = match (a) {
        case 1.0 => 0
        case _ => 1
    }
    return result
}