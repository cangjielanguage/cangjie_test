// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,0]
    var b = a.sortBy({i,j=>i>j})
    if (a==[1,0]){
        return 0
    }
    return 1
}