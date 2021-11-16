// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    if ( "${if(true){ 0}else{1}}" != "0" ) {
        return 1
    }
    return 0
}
