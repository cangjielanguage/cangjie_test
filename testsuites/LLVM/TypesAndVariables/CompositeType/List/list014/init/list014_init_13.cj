// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a = List<List<Int64>>(4,{i=>[i]})
    if (a==[[0],[1],[2],[3]]){
        return 0
    }
    return 1
}