// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = []
    var b = a.insert(0,6)
    if(b == [6]){
        return 0
    }
    return 1
}