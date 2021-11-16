// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,0]
    var b = a.sortBy({lhs, rhs => lhs < rhs})
    if (b==[0,1]){
        return 0
    }
    return 1
}