// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.set(0,6)
    if (a==[1,2,3]){
        return 0
    }
    return 1
}