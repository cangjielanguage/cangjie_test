// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = List<Int64>(4,{i=>0})
    if (a==[0,0,0,0]){
        return 0
    }
    return 1
}
