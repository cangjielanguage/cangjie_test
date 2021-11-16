//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    if ( "${if(true){return 0}else{return 1}}" != "0" ) { // EXPECTED: regex-auto undeclared identifier 'toString'
        return 1
    }
    return 0
}
