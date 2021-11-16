// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check paramType
func a(x:Int64){
    return x
}

func main(){
    let a = a(0)
    return a
}