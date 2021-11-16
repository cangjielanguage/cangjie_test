// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = []
    var b = a.appendAll(List<Int64>([0,0]))
    if (b.size()==2){
        return 0
    }
    return 1
}