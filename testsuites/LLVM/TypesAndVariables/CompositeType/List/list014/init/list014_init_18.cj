// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var b = List<Int64>([])
    if(b==[]){
        return 0
    }
    return 1
}