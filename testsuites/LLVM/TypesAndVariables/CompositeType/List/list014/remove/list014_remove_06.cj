// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<String>> = [[],["2","3"]]
    var b = a.remove(1)
    if(b==List<List<String>>([[]])){
        return 0
    }
    return 1
}
