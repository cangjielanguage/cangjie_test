// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = []
    var b = a.insertAll(0,[])
    if (b==List<Int64>([])){
        return 0
    }
    return 1
}