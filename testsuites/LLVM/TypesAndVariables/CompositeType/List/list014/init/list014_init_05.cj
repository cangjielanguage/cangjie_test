// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a:List<List<Int64>> = [[]]
    var b = List<List<Int64>>(a)
    if (b==List<List<Int64>>([[]])){
        return 0
    }
    return 1 
}
