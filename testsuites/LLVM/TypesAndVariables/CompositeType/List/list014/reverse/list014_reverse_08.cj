// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = List<Int64>(100000,{i=>i})
    var b = a.reverse()
    if (b==List<Int64>(100000,{i=>99999-i})){
        return 0
    }
    return 1
}
