// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<String>> = [[]]
    var b = a.remove(0)
    if (b==List<List<String>>([])){
        return 0
    }
    return 1
}