// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Int64>> = [[1,2,3],[4,5]]
    var b = a[0].appendAll([6,6])
    if (b.size()==5){
        return 0
    }
    return 1
}