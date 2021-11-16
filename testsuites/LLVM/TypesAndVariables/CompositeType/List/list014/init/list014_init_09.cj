// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a = Array<Int64>(4,{i=>0})
    var b = List<Int64>(a)
    if (b==[0,0,0,0]){
        return 0
    }
    return 1
}