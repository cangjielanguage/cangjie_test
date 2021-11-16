// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<String>> = [["1"],["2","3"]]
    var b = a[0].remove(0)
    if(b.size()==0){
        return 0
    }
    return 1
}
