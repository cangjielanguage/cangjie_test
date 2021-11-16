// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var i: Int32 = 0
    var str: String = match (i + 1) {
        case 0 => "matches the first case"
        case 1 => "matches the second case"
        case _ => "matches the third case"
    }
    print(str)
    0
}
