// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = []
    var b = a.insertAll(0,[6,7])
    if (b==[6,7]){
        return 0
    }
    return 1
}