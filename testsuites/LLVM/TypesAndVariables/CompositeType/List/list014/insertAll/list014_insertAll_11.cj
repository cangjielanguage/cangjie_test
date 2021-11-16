// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*
func main(){
    var a:List<Int64> = [1,2,3]
    var b = a.insertAll(0,Buffer<Int64>(4,{i=>0}))
    if (b==[0,0,0,0,1,2,3]){
        return 0
    }
    return 1
}
