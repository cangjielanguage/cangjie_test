// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*
func main(){
    var a = HashSet<Int64>(2,{i=>i+1})
    var b = List<Int64>(a)
    if (b==[1,2]){
        return 0
    }
    return 1
}
