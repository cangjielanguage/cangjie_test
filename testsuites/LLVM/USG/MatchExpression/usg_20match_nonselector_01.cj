// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var i: Int32 = 0
    var str: String = match {
        case i > 0 => "matches the first case"
        case i <= 0 => "matches the second case"
        case _ => "matches the third case"
    }
    if ( str != "matches the second case" ) {
        return 1
    }
    0
}
