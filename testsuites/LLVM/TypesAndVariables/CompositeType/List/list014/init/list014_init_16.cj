// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = List<Int64>(100000,{i=>0})
    if (a.size()==100000){
        return 0
    }
    return 1
}
