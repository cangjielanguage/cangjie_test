// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64{
    let tuplePIE = (3.14, "PIE")    
    let myTuple = ((1, 2), 3)
    if ( tuplePIE[0] != 3.14 ) {
        return 1
    }
    if ( myTuple[1] != 3 ) {
        return 1
    }
    0
}
