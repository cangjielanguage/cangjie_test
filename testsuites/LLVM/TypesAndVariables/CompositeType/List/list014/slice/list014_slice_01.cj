// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3,4]
    var b = a.slice(0..3)
    if (b==[1,2,3]){
        return 0
    }
    return 1
}
