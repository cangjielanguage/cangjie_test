// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Int64>> = [[1,2],[]]
    var b = a.reverse()
    if (b==[[],[1,2]]){
        return 0
    }
    return 1
}
