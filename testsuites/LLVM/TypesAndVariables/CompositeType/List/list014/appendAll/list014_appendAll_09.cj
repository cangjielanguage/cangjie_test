// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*
func main(){
    var a:List<Int64*Int64> = [(1,2),(3,4)]
    var b = a.appendAll(HashMap<Int64,Int64>(2,{i=>(i,i+1)}))
    if (b.size()==4){
        return 0
    }
    return 1
}
