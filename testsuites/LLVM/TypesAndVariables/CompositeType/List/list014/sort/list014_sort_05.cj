// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [0]
    var b = a.sort()
    if(b==[0]){
        return 0
    }
    return 1
}