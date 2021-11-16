// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,0,3,-1]
    var b = a.sortBy({lhs, rhs => lhs < rhs})
    if (b==[-1,0,1,3]){
        return 0
    }
    return 1
}