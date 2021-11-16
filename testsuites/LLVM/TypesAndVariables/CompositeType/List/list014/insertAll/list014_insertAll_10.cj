// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.insertAll(3,Array<Int64>(4,{i=>0}))
    if (b==[1,2,3,0,0,0,0]){
        return 0
    }
    return 1
}