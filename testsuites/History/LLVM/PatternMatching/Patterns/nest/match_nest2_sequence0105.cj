// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

let a1 = 1
var r1 = match ([a1,a1,a1]) {
    case [a:Int64,...,b:Int64] => 0
    case [a:Unit,...,b:Unit] => 1
    case _ => 3
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
