// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import collection.*
func main(){
    var a = Buffer<Int64>(2,{i=>i})
    var b = List<Int64>(a)
    if (b==[0,1]){
        return 0
    }
    return 1
}
