// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a:List<Int64> = [1,2,-1,9]
    var b = a.sortBy({i,j=>false})
    if (b==[-1,9,1,2]){
        return 0
    }
    return 1
}
