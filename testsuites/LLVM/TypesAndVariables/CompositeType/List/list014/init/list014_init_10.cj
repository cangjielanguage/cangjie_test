// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*
func main(){
    
    var a = HashMap<Int64,Int64>(4,{i=>(i,i+1)})
    var b = List<Int64*Int64>(a)
    
    if (b.size()==4){
        return 0
    }
    return 1  
    
    
}  
