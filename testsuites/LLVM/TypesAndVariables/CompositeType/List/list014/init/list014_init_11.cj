// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a = List<Int64>(4,{i=>i+1})
    if (a==[1,2,3,4]){
        return 0
    }
    return 1 
}