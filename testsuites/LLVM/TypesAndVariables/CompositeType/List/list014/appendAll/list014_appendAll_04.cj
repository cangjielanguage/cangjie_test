// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.appendAll(List<Int64>(100000,{i=>0}))
    if (b.size()==100003){
        return 0
    }
    return 1
}