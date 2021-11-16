// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [(1,2)]
    var b = [(1,2)]
    if (a==b){
        return 0
    }
    return 1
}


