// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Int64>> = [[1,-10,3],[10,9]]
    var b = a.sortBy({lhs, rhs => lhs.size() < rhs.size()})

    if (b==[[10,9],[1,-10,3]]){
        return 0
    }
    return 1
}