// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.insertAll(3,[6,7])
    if (b==[1,2,3,6,7]){
        return 0
    }
    return 1
}