// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS2021060304O6USP1400
func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){


    if ( "${match(1){case _ => 0}}" != "0") {
        return 1
    }
    //print( "${match(1){case _ => 0}}")
    return 0
}
