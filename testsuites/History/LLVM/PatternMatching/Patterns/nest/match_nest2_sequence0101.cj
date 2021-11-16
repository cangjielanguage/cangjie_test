// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var r1 = match ([(1,2),(2,3)]) {
    case [(d,c),(a,b)]=> b-a-(c-d)
    case _ => 1
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
