// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

let a1 = 50
var r1 = match ([a1,a1,a1]) {
    case [!in #{50,60,70},...,!in #{50,60,70}] => 1
    case [in #{50,60,70},...,in #{50,60,70}] => 0
    case _ => 3
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
