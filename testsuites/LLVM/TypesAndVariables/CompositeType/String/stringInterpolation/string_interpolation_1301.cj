// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    if ( "${var a = 1}" != "()" ) {
        return 1
    }
    return 0
}

extend Unit{
    func toString(){
        return "()"
    }
}