// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

let a1 = [50,70,90]
var r1 = match (a1) {
    case a@[] => 1
    case a@[50,70,90] => 0
    case a@[...] => 3
}
let a2 = @{50,70,90}
var r2 = match (a2) {
    case a@[] => 1
    case a@[50, ...] => 0
    case a@[...] => 2
}

let a4 = [50,70,90]
var r4 = match (a4) {
    case a@[50,70,80]=> 1
    case a@[...,90]=> 0
    case _ => 2
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    if ( r2 != 0 ) {
        return 2
    }
    if ( r4 != 0 ) {
        return 4
    }
    return 0
}
