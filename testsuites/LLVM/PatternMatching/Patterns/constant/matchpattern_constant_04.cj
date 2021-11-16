// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a : Bool = false
    var result: Int64 = match (a) {
        case true => 2
        case false => 0
        case _ => 1
    }
    return result
}