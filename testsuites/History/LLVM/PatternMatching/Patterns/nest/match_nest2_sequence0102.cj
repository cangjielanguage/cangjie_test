// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

let a1 = [50,70,90]
let a2 = @{50,70,90}
var r1 = match ([a1,a1]) {
    case [[],[]] => 1
    case [[50,70,90],[50, ...]] => 0
    case [...] => 3
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
