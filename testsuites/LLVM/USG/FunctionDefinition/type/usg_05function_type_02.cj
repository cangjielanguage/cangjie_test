// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func add(a: Int32, b: Int32): Int32 {
    a + b
}

func main(){

    if(add(1,2)==3){
        return 0
    }else{
        return 1
    }
    
}
