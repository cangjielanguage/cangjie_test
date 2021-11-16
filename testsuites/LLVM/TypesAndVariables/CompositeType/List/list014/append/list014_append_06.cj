// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = []
    var b = a.append(6)
    if (b[b.size()-1] == 6){
        return 0
    }  
    return 1
}